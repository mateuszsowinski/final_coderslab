(function (a, e, b, d) {
    function c(f, g) {
        this.settings = null;
        this.options = a.extend({}, c.Defaults, g);
        this.$element = a(f);
        this._handlers = {};
        this._plugins = {};
        this._supress = {};
        this._current = null;
        this._speed = null;
        this._coordinates = [];
        this._breakpoint = null;
        this._width = null;
        this._items = [];
        this._clones = [];
        this._mergers = [];
        this._widths = [];
        this._invalidated = {};
        this._pipe = [];
        this._drag = {time: null, target: null, pointer: null, stage: {start: null, current: null}, direction: null};
        this._states = {current: {}, tags: {initializing: ["busy"], animating: ["busy"], dragging: ["interacting"]}};
        a.each(["onResize", "onThrottledResize"], a.proxy(function (j, h) {
            this._handlers[h] = a.proxy(this[h], this)
        }, this));
        a.each(c.Plugins, a.proxy(function (h, i) {
            this._plugins[h.charAt(0).toLowerCase() + h.slice(1)] = new i(this)
        }, this));
        a.each(c.Workers, a.proxy(function (h, i) {
            this._pipe.push({filter: i.filter, run: a.proxy(i.run, this)})
        }, this));
        this.setup();
        this.initialize()
    }

    c.Defaults = {
        items: 3,
        loop: false,
        center: false,
        rewind: false,
        checkVisibility: true,
        mouseDrag: true,
        touchDrag: true,
        pullDrag: true,
        freeDrag: false,
        margin: 0,
        stagePadding: 0,
        merge: false,
        mergeFit: true,
        autoWidth: false,
        startPosition: 0,
        rtl: false,
        smartSpeed: 250,
        fluidSpeed: false,
        dragEndSpeed: false,
        responsive: {},
        responsiveRefreshRate: 200,
        responsiveBaseElement: e,
        fallbackEasing: "swing",
        slideTransition: "",
        info: false,
        nestedItemSelector: false,
        itemElement: "div",
        stageElement: "div",
        refreshClass: "owl-refresh",
        loadedClass: "owl-loaded",
        loadingClass: "owl-loading",
        rtlClass: "owl-rtl",
        responsiveClass: "owl-responsive",
        dragClass: "owl-drag",
        itemClass: "owl-item",
        stageClass: "owl-stage",
        stageOuterClass: "owl-stage-outer",
        grabClass: "owl-grab"
    };
    c.Width = {Default: "default", Inner: "inner", Outer: "outer"};
    c.Type = {Event: "event", State: "state"};
    c.Plugins = {};
    c.Workers = [{
        filter: ["width", "settings"], run: function () {
            this._width = this.$element.width()
        }
    }, {
        filter: ["width", "items", "settings"], run: function (f) {
            f.current = this._items && this._items[this.relative(this._current)]
        }
    }, {
        filter: ["items", "settings"], run: function () {
            this.$stage.children(".cloned").remove()
        }
    }, {
        filter: ["width", "items", "settings"], run: function (f) {
            var i = this.settings.margin || "", h = !this.settings.autoWidth, j = this.settings.rtl,
                g = {width: "auto", "margin-left": j ? i : "", "margin-right": j ? "" : i};
            !h && this.$stage.children().css(g);
            f.css = g
        }
    }, {
        filter: ["width", "items", "settings"], run: function (f) {
            var j = (this.width() / this.settings.items).toFixed(3) - this.settings.margin, i = null,
                h = this._items.length, g = !this.settings.autoWidth, k = [];
            f.items = {merge: false, width: j};
            while (h--) {
                i = this._mergers[h];
                i = this.settings.mergeFit && Math.min(i, this.settings.items) || i;
                f.items.merge = i > 1 || f.items.merge;
                k[h] = !g ? this._items[h].width() : j * i
            }
            this._widths = k
        }
    }, {
        filter: ["items", "settings"], run: function () {
            var g = [], h = this._items, k = this.settings, m = Math.max(k.items * 2, 4),
                l = Math.ceil(h.length / 2) * 2, j = k.loop && h.length ? k.rewind ? m : Math.max(m, l) : 0, f = "",
                i = "";
            j /= 2;
            while (j > 0) {
                g.push(this.normalize(g.length / 2, true));
                f = f + h[g[g.length - 1]][0].outerHTML;
                g.push(this.normalize(h.length - 1 - (g.length - 1) / 2, true));
                i = h[g[g.length - 1]][0].outerHTML + i;
                j -= 1
            }
            this._clones = g;
            a(f).addClass("cloned").appendTo(this.$stage);
            a(i).addClass("cloned").prependTo(this.$stage)
        }
    }, {
        filter: ["width", "items", "settings"], run: function () {
            var j = this.settings.rtl ? 1 : -1, k = this._clones.length + this._items.length, h = -1, i = 0, g = 0,
                f = [];
            while (++h < k) {
                i = f[h - 1] || 0;
                g = this._widths[this.relative(h)] + this.settings.margin;
                f.push(i + g * j)
            }
            this._coordinates = f
        }
    }, {
        filter: ["width", "items", "settings"], run: function () {
            var h = this.settings.stagePadding, f = this._coordinates, g = {
                width: Math.ceil(Math.abs(f[f.length - 1])) + h * 2,
                "padding-left": h || "",
                "padding-right": h || ""
            };
            this.$stage.css(g)
        }
    }, {
        filter: ["width", "items", "settings"], run: function (f) {
            var i = this._coordinates.length, g = !this.settings.autoWidth, h = this.$stage.children();
            if (g && f.items.merge) {
                while (i--) {
                    f.css.width = this._widths[this.relative(i)];
                    h.eq(i).css(f.css)
                }
            } else {
                if (g) {
                    f.css.width = f.items.width;
                    h.css(f.css)
                }
            }
        }
    }, {
        filter: ["items"], run: function () {
            this._coordinates.length < 1 && this.$stage.removeAttr("style")
        }
    }, {
        filter: ["width", "items", "settings"], run: function (f) {
            f.current = f.current ? this.$stage.children().index(f.current) : 0;
            f.current = Math.max(this.minimum(), Math.min(this.maximum(), f.current));
            this.reset(f.current)
        }
    }, {
        filter: ["position"], run: function () {
            this.animate(this.coordinates(this._current))
        }
    }, {
        filter: ["width", "position", "items", "settings"], run: function () {
            var p = this.settings.rtl ? 1 : -1, o = this.settings.stagePadding * 2,
                f = this.coordinates(this.current()) + o, g = f + this.width() * p, j, m, k = [], h, l;
            for (h = 0, l = this._coordinates.length; h < l; h++) {
                j = this._coordinates[h - 1] || 0;
                m = Math.abs(this._coordinates[h]) + o * p;
                if ((this.op(j, "<=", f) && (this.op(j, ">", g))) || (this.op(m, "<", f) && this.op(m, ">", g))) {
                    k.push(h)
                }
            }
            this.$stage.children(".active").removeClass("active");
            this.$stage.children(":eq(" + k.join("), :eq(") + ")").addClass("active");
            this.$stage.children(".center").removeClass("center");
            if (this.settings.center) {
                this.$stage.children().eq(this.current()).addClass("center")
            }
        }
    }];
    c.prototype.initializeStage = function () {
        this.$stage = this.$element.find("." + this.settings.stageClass);
        if (this.$stage.length) {
            return
        }
        this.$element.addClass(this.options.loadingClass);
        this.$stage = a("<" + this.settings.stageElement + ">", {"class": this.settings.stageClass}).wrap(a("<div/>", {"class": this.settings.stageOuterClass}));
        this.$element.append(this.$stage.parent())
    };
    c.prototype.initializeItems = function () {
        var f = this.$element.find(".owl-item");
        if (f.length) {
            this._items = f.get().map(function (g) {
                return a(g)
            });
            this._mergers = this._items.map(function () {
                return 1
            });
            this.refresh();
            return
        }
        this.replace(this.$element.children().not(this.$stage.parent()));
        if (this.isVisible()) {
            this.refresh()
        } else {
            this.invalidate("width")
        }
        this.$element.removeClass(this.options.loadingClass).addClass(this.options.loadedClass)
    };
    c.prototype.initialize = function () {
        this.enter("initializing");
        this.trigger("initialize");
        this.$element.toggleClass(this.settings.rtlClass, this.settings.rtl);
        if (this.settings.autoWidth && !this.is("pre-loading")) {
            var f, g, h;
            f = this.$element.find("img");
            g = this.settings.nestedItemSelector ? "." + this.settings.nestedItemSelector : d;
            h = this.$element.children(g).width();
            if (f.length && h <= 0) {
                this.preloadAutoWidthImages(f)
            }
        }
        this.initializeStage();
        this.initializeItems();
        this.registerEventHandlers();
        this.leave("initializing");
        this.trigger("initialized")
    };
    c.prototype.isVisible = function () {
        return this.settings.checkVisibility ? this.$element.is(":visible") : true
    };
    c.prototype.setup = function () {
        var i = this.viewport(), g = this.options.responsive, f = -1, h = null;
        if (!g) {
            h = a.extend({}, this.options)
        } else {
            a.each(g, function (j) {
                if (j <= i && j > f) {
                    f = Number(j)
                }
            });
            h = a.extend({}, this.options, g[f]);
            if (typeof h.stagePadding === "function") {
                h.stagePadding = h.stagePadding()
            }
            delete h.responsive;
            if (h.responsiveClass) {
                this.$element.attr("class", this.$element.attr("class").replace(new RegExp("(" + this.options.responsiveClass + "-)\\S+\\s", "g"), "$1" + f))
            }
        }
        this.trigger("change", {property: {name: "settings", value: h}});
        this._breakpoint = f;
        this.settings = h;
        this.invalidate("settings");
        this.trigger("changed", {property: {name: "settings", value: this.settings}})
    };
    c.prototype.optionsLogic = function () {
        if (this.settings.autoWidth) {
            this.settings.stagePadding = false;
            this.settings.merge = false
        }
    };
    c.prototype.prepare = function (g) {
        var f = this.trigger("prepare", {content: g});
        if (!f.data) {
            f.data = a("<" + this.settings.itemElement + "/>").addClass(this.options.itemClass).append(g)
        }
        this.trigger("prepared", {content: f.data});
        return f.data
    };
    c.prototype.update = function () {
        var h = 0, j = this._pipe.length, g = a.proxy(function (i) {
            return this[i]
        }, this._invalidated), f = {};
        while (h < j) {
            if (this._invalidated.all || a.grep(this._pipe[h].filter, g).length > 0) {
                this._pipe[h].run(f)
            }
            h++
        }
        this._invalidated = {};
        !this.is("valid") && this.enter("valid")
    };
    c.prototype.width = function (f) {
        f = f || c.Width.Default;
        switch (f) {
            case c.Width.Inner:
            case c.Width.Outer:
                return this._width;
            default:
                return this._width - this.settings.stagePadding * 2 + this.settings.margin
        }
    };
    c.prototype.refresh = function () {
        this.enter("refreshing");
        this.trigger("refresh");
        this.setup();
        this.optionsLogic();
        this.$element.addClass(this.options.refreshClass);
        this.update();
        this.$element.removeClass(this.options.refreshClass);
        this.leave("refreshing");
        this.trigger("refreshed")
    };
    c.prototype.onThrottledResize = function () {
        e.clearTimeout(this.resizeTimer);
        this.resizeTimer = e.setTimeout(this._handlers.onResize, this.settings.responsiveRefreshRate)
    };
    c.prototype.onResize = function () {
        if (!this._items.length) {
            return false
        }
        if (this._width === this.$element.width()) {
            return false
        }
        if (!this.isVisible()) {
            return false
        }
        this.enter("resizing");
        if (this.trigger("resize").isDefaultPrevented()) {
            this.leave("resizing");
            return false
        }
        this.invalidate("width");
        this.refresh();
        this.leave("resizing");
        this.trigger("resized")
    };
    c.prototype.registerEventHandlers = function () {
        if (a.support.transition) {
            this.$stage.on(a.support.transition.end + ".owl.core", a.proxy(this.onTransitionEnd, this))
        }
        if (this.settings.responsive !== false) {
            this.on(e, "resize", this._handlers.onThrottledResize)
        }
        if (this.settings.mouseDrag) {
            this.$element.addClass(this.options.dragClass);
            this.$stage.on("mousedown.owl.core", a.proxy(this.onDragStart, this));
            this.$stage.on("dragstart.owl.core selectstart.owl.core", function () {
                return false
            })
        }
        if (this.settings.touchDrag) {
            this.$stage.on("touchstart.owl.core", a.proxy(this.onDragStart, this));
            this.$stage.on("touchcancel.owl.core", a.proxy(this.onDragEnd, this))
        }
    };
    c.prototype.onDragStart = function (f) {
        var g = null;
        if (f.which === 3) {
            return
        }
        if (a.support.transform) {
            g = this.$stage.css("transform").replace(/.*\(|\)| /g, "").split(",");
            g = {x: g[g.length === 16 ? 12 : 4], y: g[g.length === 16 ? 13 : 5]}
        } else {
            g = this.$stage.position();
            g = {
                x: this.settings.rtl ? g.left + this.$stage.width() - this.width() + this.settings.margin : g.left,
                y: g.top
            }
        }
        if (this.is("animating")) {
            a.support.transform ? this.animate(g.x) : this.$stage.stop();
            this.invalidate("position")
        }
        this.$element.toggleClass(this.options.grabClass, f.type === "mousedown");
        this.speed(0);
        this._drag.time = new Date().getTime();
        this._drag.target = a(f.target);
        this._drag.stage.start = g;
        this._drag.stage.current = g;
        this._drag.pointer = this.pointer(f);
        a(b).on("mouseup.owl.core touchend.owl.core", a.proxy(this.onDragEnd, this));
        a(b).one("mousemove.owl.core touchmove.owl.core", a.proxy(function (i) {
            var h = this.difference(this._drag.pointer, this.pointer(i));
            a(b).on("mousemove.owl.core touchmove.owl.core", a.proxy(this.onDragMove, this));
            if (Math.abs(h.x) < Math.abs(h.y) && this.is("valid")) {
                return
            }
            i.preventDefault();
            this.enter("dragging");
            this.trigger("drag")
        }, this))
    };
    c.prototype.onDragMove = function (g) {
        var i = null, h = null, j = null, f = this.difference(this._drag.pointer, this.pointer(g)),
            k = this.difference(this._drag.stage.start, f);
        if (!this.is("dragging")) {
            return
        }
        g.preventDefault();
        if (this.settings.loop) {
            i = this.coordinates(this.minimum());
            h = this.coordinates(this.maximum() + 1) - i;
            k.x = (((k.x - i) % h + h) % h) + i
        } else {
            i = this.settings.rtl ? this.coordinates(this.maximum()) : this.coordinates(this.minimum());
            h = this.settings.rtl ? this.coordinates(this.minimum()) : this.coordinates(this.maximum());
            j = this.settings.pullDrag ? -1 * f.x / 5 : 0;
            k.x = Math.max(Math.min(k.x, i + j), h + j)
        }
        this._drag.stage.current = k;
        this.animate(k.x)
    };
    c.prototype.onDragEnd = function (h) {
        var f = this.difference(this._drag.pointer, this.pointer(h)), i = this._drag.stage.current,
            g = f.x > 0 ^ this.settings.rtl ? "left" : "right";
        a(b).off(".owl.core");
        this.$element.removeClass(this.options.grabClass);
        if (f.x !== 0 && this.is("dragging") || !this.is("valid")) {
            this.speed(this.settings.dragEndSpeed || this.settings.smartSpeed);
            this.current(this.closest(i.x, f.x !== 0 ? g : this._drag.direction));
            this.invalidate("position");
            this.update();
            this._drag.direction = g;
            if (Math.abs(f.x) > 3 || new Date().getTime() - this._drag.time > 300) {
                this._drag.target.one("click.owl.core", function () {
                    return false
                })
            }
        }
        if (!this.is("dragging")) {
            return
        }
        this.leave("dragging");
        this.trigger("dragged")
    };
    c.prototype.closest = function (f, h) {
        var i = -1, j = 30, k = this.width(), g = this.coordinates();
        if (!this.settings.freeDrag) {
            a.each(g, a.proxy(function (l, m) {
                if (h === "left" && f > m - j && f < m + j) {
                    i = l
                } else {
                    if (h === "right" && f > m - k - j && f < m - k + j) {
                        i = l + 1
                    } else {
                        if (this.op(f, "<", m) && this.op(f, ">", g[l + 1] !== d ? g[l + 1] : m - k)) {
                            i = h === "left" ? l + 1 : l
                        }
                    }
                }
                return i === -1
            }, this))
        }
        if (!this.settings.loop) {
            if (this.op(f, ">", g[this.minimum()])) {
                i = f = this.minimum()
            } else {
                if (this.op(f, "<", g[this.maximum()])) {
                    i = f = this.maximum()
                }
            }
        }
        return i
    };
    c.prototype.animate = function (g) {
        var f = this.speed() > 0;
        this.is("animating") && this.onTransitionEnd();
        if (f) {
            this.enter("animating");
            this.trigger("translate")
        }
        if (a.support.transform3d && a.support.transition) {
            this.$stage.css({
                transform: "translate3d(" + g + "px,0px,0px)",
                transition: (this.speed() / 1000) + "s" + (this.settings.slideTransition ? " " + this.settings.slideTransition : "")
            })
        } else {
            if (f) {
                this.$stage.animate({left: g + "px"}, this.speed(), this.settings.fallbackEasing, a.proxy(this.onTransitionEnd, this))
            } else {
                this.$stage.css({left: g + "px"})
            }
        }
    };
    c.prototype.is = function (f) {
        return this._states.current[f] && this._states.current[f] > 0
    };
    c.prototype.current = function (g) {
        if (g === d) {
            return this._current
        }
        if (this._items.length === 0) {
            return d
        }
        g = this.normalize(g);
        if (this._current !== g) {
            var f = this.trigger("change", {property: {name: "position", value: g}});
            if (f.data !== d) {
                g = this.normalize(f.data)
            }
            this._current = g;
            this.invalidate("position");
            this.trigger("changed", {property: {name: "position", value: this._current}})
        }
        return this._current
    };
    c.prototype.invalidate = function (f) {
        if (a.type(f) === "string") {
            this._invalidated[f] = true;
            this.is("valid") && this.leave("valid")
        }
        return a.map(this._invalidated, function (h, g) {
            return g
        })
    };
    c.prototype.reset = function (f) {
        f = this.normalize(f);
        if (f === d) {
            return
        }
        this._speed = 0;
        this._current = f;
        this.suppress(["translate", "translated"]);
        this.animate(this.coordinates(f));
        this.release(["translate", "translated"])
    };
    c.prototype.normalize = function (h, i) {
        var g = this._items.length, f = i ? 0 : this._clones.length;
        if (!this.isNumeric(h) || g < 1) {
            h = d
        } else {
            if (h < 0 || h >= g + f) {
                h = ((h - f / 2) % g + g) % g + f / 2
            }
        }
        return h
    };
    c.prototype.relative = function (f) {
        f -= this._clones.length / 2;
        return this.normalize(f, true)
    };
    c.prototype.maximum = function (j) {
        var k = this.settings, h = this._coordinates.length, g, i, f;
        if (k.loop) {
            h = this._clones.length / 2 + this._items.length - 1
        } else {
            if (k.autoWidth || k.merge) {
                g = this._items.length;
                if (g) {
                    i = this._items[--g].width();
                    f = this.$element.width();
                    while (g--) {
                        i += this._items[g].width() + this.settings.margin;
                        if (i > f) {
                            break
                        }
                    }
                }
                h = g + 1
            } else {
                if (k.center) {
                    h = this._items.length - 1
                } else {
                    h = this._items.length - k.items
                }
            }
        }
        if (j) {
            h -= this._clones.length / 2
        }
        return Math.max(h, 0)
    };
    c.prototype.minimum = function (f) {
        return f ? 0 : this._clones.length / 2
    };
    c.prototype.items = function (f) {
        if (f === d) {
            return this._items.slice()
        }
        f = this.normalize(f, true);
        return this._items[f]
    };
    c.prototype.mergers = function (f) {
        if (f === d) {
            return this._mergers.slice()
        }
        f = this.normalize(f, true);
        return this._mergers[f]
    };
    c.prototype.clones = function (i) {
        var h = this._clones.length / 2, f = h + this._items.length, g = function (j) {
            return j % 2 === 0 ? f + j / 2 : h - (j + 1) / 2
        };
        if (i === d) {
            return a.map(this._clones, function (k, j) {
                return g(j)
            })
        }
        return a.map(this._clones, function (k, j) {
            return k === i ? g(j) : null
        })
    };
    c.prototype.speed = function (f) {
        if (f !== d) {
            this._speed = f
        }
        return this._speed
    };
    c.prototype.coordinates = function (i) {
        var g = 1, h = i - 1, f;
        if (i === d) {
            return a.map(this._coordinates, a.proxy(function (j, k) {
                return this.coordinates(k)
            }, this))
        }
        if (this.settings.center) {
            if (this.settings.rtl) {
                g = -1;
                h = i + 1
            }
            f = this._coordinates[i];
            f += (this.width() - f + (this._coordinates[h] || 0)) / 2 * g
        } else {
            f = this._coordinates[h] || 0
        }
        f = Math.ceil(f);
        return f
    };
    c.prototype.duration = function (g, h, f) {
        if (f === 0) {
            return 0
        }
        return Math.min(Math.max(Math.abs(h - g), 1), 6) * Math.abs((f || this.settings.smartSpeed))
    };
    c.prototype.to = function (l, n) {
        var f = this.current(), m = null, h = l - this.relative(f), g = (h > 0) - (h < 0), i = this._items.length,
            k = this.minimum(), j = this.maximum();
        if (this.settings.loop) {
            if (!this.settings.rewind && Math.abs(h) > i / 2) {
                h += g * -1 * i
            }
            l = f + h;
            m = ((l - k) % i + i) % i + k;
            if (m !== l && m - h <= j && m - h > 0) {
                f = m - h;
                l = m;
                this.reset(f)
            }
        } else {
            if (this.settings.rewind) {
                j += 1;
                l = (l % j + j) % j
            } else {
                l = Math.max(k, Math.min(j, l))
            }
        }
        this.speed(this.duration(f, l, n));
        this.current(l);
        if (this.isVisible()) {
            this.update()
        }
    };
    c.prototype.next = function (f) {
        f = f || false;
        this.to(this.relative(this.current()) + 1, f)
    };
    c.prototype.prev = function (f) {
        f = f || false;
        this.to(this.relative(this.current()) - 1, f)
    };
    c.prototype.onTransitionEnd = function (f) {
        if (f !== d) {
            f.stopPropagation();
            if ((f.target || f.srcElement || f.originalTarget) !== this.$stage.get(0)) {
                return false
            }
        }
        this.leave("animating");
        this.trigger("translated")
    };
    c.prototype.viewport = function () {
        var f;
        if (this.options.responsiveBaseElement !== e) {
            f = a(this.options.responsiveBaseElement).width()
        } else {
            if (e.innerWidth) {
                f = e.innerWidth
            } else {
                if (b.documentElement && b.documentElement.clientWidth) {
                    f = b.documentElement.clientWidth
                } else {
                    console.warn("Can not detect viewport width.")
                }
            }
        }
        return f
    };
    c.prototype.replace = function (f) {
        this.$stage.empty();
        this._items = [];
        if (f) {
            f = (f instanceof jQuery) ? f : a(f)
        }
        if (this.settings.nestedItemSelector) {
            f = f.find("." + this.settings.nestedItemSelector)
        }
        f.filter(function () {
            return this.nodeType === 1
        }).each(a.proxy(function (g, h) {
            h = this.prepare(h);
            this.$stage.append(h);
            this._items.push(h);
            this._mergers.push(h.find("[data-merge]").addBack("[data-merge]").attr("data-merge") * 1 || 1)
        }, this));
        this.reset(this.isNumeric(this.settings.startPosition) ? this.settings.startPosition : 0);
        this.invalidate("items")
    };
    c.prototype.add = function (f, h) {
        var g = this.relative(this._current);
        h = h === d ? this._items.length : this.normalize(h, true);
        f = f instanceof jQuery ? f : a(f);
        this.trigger("add", {content: f, position: h});
        f = this.prepare(f);
        if (this._items.length === 0 || h === this._items.length) {
            this._items.length === 0 && this.$stage.append(f);
            this._items.length !== 0 && this._items[h - 1].after(f);
            this._items.push(f);
            this._mergers.push(f.find("[data-merge]").addBack("[data-merge]").attr("data-merge") * 1 || 1)
        } else {
            this._items[h].before(f);
            this._items.splice(h, 0, f);
            this._mergers.splice(h, 0, f.find("[data-merge]").addBack("[data-merge]").attr("data-merge") * 1 || 1)
        }
        this._items[g] && this.reset(this._items[g].index());
        this.invalidate("items");
        this.trigger("added", {content: f, position: h})
    };
    c.prototype.remove = function (f) {
        f = this.normalize(f, true);
        if (f === d) {
            return
        }
        this.trigger("remove", {content: this._items[f], position: f});
        this._items[f].remove();
        this._items.splice(f, 1);
        this._mergers.splice(f, 1);
        this.invalidate("items");
        this.trigger("removed", {content: null, position: f})
    };
    c.prototype.preloadAutoWidthImages = function (f) {
        f.each(a.proxy(function (h, g) {
            this.enter("pre-loading");
            g = a(g);
            a(new Image()).one("load", a.proxy(function (i) {
                g.attr("src", i.target.src);
                g.css("opacity", 1);
                this.leave("pre-loading");
                !this.is("pre-loading") && !this.is("initializing") && this.refresh()
            }, this)).attr("src", g.attr("src") || g.attr("data-src") || g.attr("data-src-retina"))
        }, this))
    };
    c.prototype.destroy = function () {
        this.$element.off(".owl.core");
        this.$stage.off(".owl.core");
        a(b).off(".owl.core");
        if (this.settings.responsive !== false) {
            e.clearTimeout(this.resizeTimer);
            this.off(e, "resize", this._handlers.onThrottledResize)
        }
        for (var f in this._plugins) {
            this._plugins[f].destroy()
        }
        this.$stage.children(".cloned").remove();
        this.$stage.unwrap();
        this.$stage.children().contents().unwrap();
        this.$stage.children().unwrap();
        this.$stage.remove();
        this.$element.removeClass(this.options.refreshClass).removeClass(this.options.loadingClass).removeClass(this.options.loadedClass).removeClass(this.options.rtlClass).removeClass(this.options.dragClass).removeClass(this.options.grabClass).attr("class", this.$element.attr("class").replace(new RegExp(this.options.responsiveClass + "-\\S+\\s", "g"), "")).removeData("owl.carousel")
    };
    c.prototype.op = function (f, h, g) {
        var i = this.settings.rtl;
        switch (h) {
            case"<":
                return i ? f > g : f < g;
            case">":
                return i ? f < g : f > g;
            case">=":
                return i ? f <= g : f >= g;
            case"<=":
                return i ? f >= g : f <= g;
            default:
                break
        }
    };
    c.prototype.on = function (g, h, i, f) {
        if (g.addEventListener) {
            g.addEventListener(h, i, f)
        } else {
            if (g.attachEvent) {
                g.attachEvent("on" + h, i)
            }
        }
    };
    c.prototype.off = function (g, h, i, f) {
        if (g.removeEventListener) {
            g.removeEventListener(h, i, f)
        } else {
            if (g.detachEvent) {
                g.detachEvent("on" + h, i)
            }
        }
    };
    c.prototype.trigger = function (j, f, k, l, g) {
        var m = {item: {count: this._items.length, index: this.current()}},
            i = a.camelCase(a.grep(["on", j, k], function (n) {
                return n
            }).join("-").toLowerCase()),
            h = a.Event([j, "owl", k || "carousel"].join(".").toLowerCase(), a.extend({relatedTarget: this}, m, f));
        if (!this._supress[j]) {
            a.each(this._plugins, function (n, o) {
                if (o.onTrigger) {
                    o.onTrigger(h)
                }
            });
            this.register({type: c.Type.Event, name: j});
            this.$element.trigger(h);
            if (this.settings && typeof this.settings[i] === "function") {
                this.settings[i].call(this, h)
            }
        }
        return h
    };
    c.prototype.enter = function (f) {
        a.each([f].concat(this._states.tags[f] || []), a.proxy(function (g, h) {
            if (this._states.current[h] === d) {
                this._states.current[h] = 0
            }
            this._states.current[h]++
        }, this))
    };
    c.prototype.leave = function (f) {
        a.each([f].concat(this._states.tags[f] || []), a.proxy(function (g, h) {
            this._states.current[h]--
        }, this))
    };
    c.prototype.register = function (g) {
        if (g.type === c.Type.Event) {
            if (!a.event.special[g.name]) {
                a.event.special[g.name] = {}
            }
            if (!a.event.special[g.name].owl) {
                var f = a.event.special[g.name]._default;
                a.event.special[g.name]._default = function (h) {
                    if (f && f.apply && (!h.namespace || h.namespace.indexOf("owl") === -1)) {
                        return f.apply(this, arguments)
                    }
                    return h.namespace && h.namespace.indexOf("owl") > -1
                };
                a.event.special[g.name].owl = true
            }
        } else {
            if (g.type === c.Type.State) {
                if (!this._states.tags[g.name]) {
                    this._states.tags[g.name] = g.tags
                } else {
                    this._states.tags[g.name] = this._states.tags[g.name].concat(g.tags)
                }
                this._states.tags[g.name] = a.grep(this._states.tags[g.name], a.proxy(function (j, h) {
                    return a.inArray(j, this._states.tags[g.name]) === h
                }, this))
            }
        }
    };
    c.prototype.suppress = function (f) {
        a.each(f, a.proxy(function (h, g) {
            this._supress[g] = true
        }, this))
    };
    c.prototype.release = function (f) {
        a.each(f, a.proxy(function (h, g) {
            delete this._supress[g]
        }, this))
    };
    c.prototype.pointer = function (f) {
        var g = {x: null, y: null};
        f = f.originalEvent || f || e.event;
        f = f.touches && f.touches.length ? f.touches[0] : f.changedTouches && f.changedTouches.length ? f.changedTouches[0] : f;
        if (f.pageX) {
            g.x = f.pageX;
            g.y = f.pageY
        } else {
            g.x = f.clientX;
            g.y = f.clientY
        }
        return g
    };
    c.prototype.isNumeric = function (f) {
        return !isNaN(parseFloat(f))
    };
    c.prototype.difference = function (f, g) {
        return {x: f.x - g.x, y: f.y - g.y}
    };
    a.fn.owlCarousel = function (g) {
        var f = Array.prototype.slice.call(arguments, 1);
        return this.each(function () {
            var h = a(this), i = h.data("owl.carousel");
            if (!i) {
                i = new c(this, typeof g == "object" && g);
                h.data("owl.carousel", i);
                a.each(["next", "prev", "to", "destroy", "refresh", "replace", "add", "remove"], function (k, j) {
                    i.register({type: c.Type.Event, name: j});
                    i.$element.on(j + ".owl.carousel.core", a.proxy(function (l) {
                        if (l.namespace && l.relatedTarget !== this) {
                            this.suppress([j]);
                            i[j].apply(this, [].slice.call(arguments, 1));
                            this.release([j])
                        }
                    }, i))
                })
            }
            if (typeof g == "string" && g.charAt(0) !== "_") {
                i[g].apply(i, f)
            }
        })
    };
    a.fn.owlCarousel.Constructor = c
})(window.Zepto || window.jQuery, window, document);
(function (a, e, c, d) {
    var b = function (f) {
        this._core = f;
        this._interval = null;
        this._visible = null;
        this._handlers = {
            "initialized.owl.carousel": a.proxy(function (g) {
                if (g.namespace && this._core.settings.autoRefresh) {
                    this.watch()
                }
            }, this)
        };
        this._core.options = a.extend({}, b.Defaults, this._core.options);
        this._core.$element.on(this._handlers)
    };
    b.Defaults = {autoRefresh: true, autoRefreshInterval: 500};
    b.prototype.watch = function () {
        if (this._interval) {
            return
        }
        this._visible = this._core.isVisible();
        this._interval = e.setInterval(a.proxy(this.refresh, this), this._core.settings.autoRefreshInterval)
    };
    b.prototype.refresh = function () {
        if (this._core.isVisible() === this._visible) {
            return
        }
        this._visible = !this._visible;
        this._core.$element.toggleClass("owl-hidden", !this._visible);
        this._visible && (this._core.invalidate("width") && this._core.refresh())
    };
    b.prototype.destroy = function () {
        var f, g;
        e.clearInterval(this._interval);
        for (f in this._handlers) {
            this._core.$element.off(f, this._handlers[f])
        }
        for (g in Object.getOwnPropertyNames(this)) {
            typeof this[g] != "function" && (this[g] = null)
        }
    };
    a.fn.owlCarousel.Constructor.Plugins.AutoRefresh = b
})(window.Zepto || window.jQuery, window, document);
(function (a, e, b, d) {
    var c = function (f) {
        this._core = f;
        this._loaded = [];
        this._handlers = {
            "initialized.owl.carousel change.owl.carousel resized.owl.carousel": a.proxy(function (h) {
                if (!h.namespace) {
                    return
                }
                if (!this._core.settings || !this._core.settings.lazyLoad) {
                    return
                }
                if ((h.property && h.property.name == "position") || h.type == "initialized") {
                    var o = this._core.settings, l = (o.center && Math.ceil(o.items / 2) || o.items),
                        j = ((o.center && l * -1) || 0),
                        m = (h.property && h.property.value !== d ? h.property.value : this._core.current()) + j,
                        g = this._core.clones().length, k = a.proxy(function (n, p) {
                            this.load(p)
                        }, this);
                    if (o.lazyLoadEager > 0) {
                        l += o.lazyLoadEager;
                        if (o.loop) {
                            m -= o.lazyLoadEager;
                            l++
                        }
                    }
                    while (j++ < l) {
                        this.load(g / 2 + this._core.relative(m));
                        g && a.each(this._core.clones(this._core.relative(m)), k);
                        m++
                    }
                }
            }, this)
        };
        this._core.options = a.extend({}, c.Defaults, this._core.options);
        this._core.$element.on(this._handlers)
    };
    c.Defaults = {lazyLoad: false, lazyLoadEager: 0};
    c.prototype.load = function (h) {
        var g = this._core.$stage.children().eq(h), f = g && g.find(".owl-lazy");
        if (!f || a.inArray(g.get(0), this._loaded) > -1) {
            return
        }
        f.each(a.proxy(function (l, j) {
            var i = a(j), k,
                m = (e.devicePixelRatio > 1 && i.attr("data-src-retina")) || i.attr("data-src") || i.attr("data-srcset");
            this._core.trigger("load", {element: i, url: m}, "lazy");
            if (i.is("img")) {
                i.one("load.owl.lazy", a.proxy(function () {
                    i.css("opacity", 1);
                    this._core.trigger("loaded", {element: i, url: m}, "lazy")
                }, this)).attr("src", m)
            } else {
                if (i.is("source")) {
                    i.one("load.owl.lazy", a.proxy(function () {
                        this._core.trigger("loaded", {element: i, url: m}, "lazy")
                    }, this)).attr("srcset", m)
                } else {
                    k = new Image();
                    k.onload = a.proxy(function () {
                        i.css({"background-image": 'url("' + m + '")', opacity: "1"});
                        this._core.trigger("loaded", {element: i, url: m}, "lazy")
                    }, this);
                    k.src = m
                }
            }
        }, this));
        this._loaded.push(g.get(0))
    };
    c.prototype.destroy = function () {
        var f, g;
        for (f in this.handlers) {
            this._core.$element.off(f, this.handlers[f])
        }
        for (g in Object.getOwnPropertyNames(this)) {
            typeof this[g] != "function" && (this[g] = null)
        }
    };
    a.fn.owlCarousel.Constructor.Plugins.Lazy = c
})(window.Zepto || window.jQuery, window, document);
(function (a, e, c, d) {
    var b = function (f) {
        this._core = f;
        this._previousHeight = null;
        this._handlers = {
            "initialized.owl.carousel refreshed.owl.carousel": a.proxy(function (h) {
                if (h.namespace && this._core.settings.autoHeight) {
                    this.update()
                }
            }, this), "changed.owl.carousel": a.proxy(function (h) {
                if (h.namespace && this._core.settings.autoHeight && h.property.name === "position") {
                    this.update()
                }
            }, this), "loaded.owl.lazy": a.proxy(function (h) {
                if (h.namespace && this._core.settings.autoHeight && h.element.closest("." + this._core.settings.itemClass).index() === this._core.current()) {
                    this.update()
                }
            }, this)
        };
        this._core.options = a.extend({}, b.Defaults, this._core.options);
        this._core.$element.on(this._handlers);
        this._intervalId = null;
        var g = this;
        a(e).on("load", function () {
            if (g._core.settings.autoHeight) {
                g.update()
            }
        });
        a(e).resize(function () {
            if (g._core.settings.autoHeight) {
                if (g._intervalId != null) {
                    clearTimeout(g._intervalId)
                }
                g._intervalId = setTimeout(function () {
                    g.update()
                }, 250)
            }
        })
    };
    b.Defaults = {autoHeight: false, autoHeightClass: "owl-height"};
    b.prototype.update = function () {
        var j = this._core._current, f = j + this._core.settings.items, h = this._core.settings.lazyLoad,
            k = this._core.$stage.children().toArray().slice(j, f), g = [], i = 0;
        a.each(k, function (l, m) {
            g.push(a(m).height())
        });
        i = Math.max.apply(null, g);
        if (i <= 1 && h && this._previousHeight) {
            i = this._previousHeight
        }
        this._previousHeight = i;
        this._core.$stage.parent().height(i).addClass(this._core.settings.autoHeightClass)
    };
    b.prototype.destroy = function () {
        var f, g;
        for (f in this._handlers) {
            this._core.$element.off(f, this._handlers[f])
        }
        for (g in Object.getOwnPropertyNames(this)) {
            typeof this[g] !== "function" && (this[g] = null)
        }
    };
    a.fn.owlCarousel.Constructor.Plugins.AutoHeight = b
})(window.Zepto || window.jQuery, window, document);
(function (a, e, b, c) {
    var d = function (f) {
        this._core = f;
        this._videos = {};
        this._playing = null;
        this._handlers = {
            "initialized.owl.carousel": a.proxy(function (g) {
                if (g.namespace) {
                    this._core.register({type: "state", name: "playing", tags: ["interacting"]})
                }
            }, this), "resize.owl.carousel": a.proxy(function (g) {
                if (g.namespace && this._core.settings.video && this.isInFullScreen()) {
                    g.preventDefault()
                }
            }, this), "refreshed.owl.carousel": a.proxy(function (g) {
                if (g.namespace && this._core.is("resizing")) {
                    this._core.$stage.find(".cloned .owl-video-frame").remove()
                }
            }, this), "changed.owl.carousel": a.proxy(function (g) {
                if (g.namespace && g.property.name === "position" && this._playing) {
                    this.stop()
                }
            }, this), "prepared.owl.carousel": a.proxy(function (h) {
                if (!h.namespace) {
                    return
                }
                var g = a(h.content).find(".owl-video");
                if (g.length) {
                    g.css("display", "none");
                    this.fetch(g, a(h.content))
                }
            }, this)
        };
        this._core.options = a.extend({}, d.Defaults, this._core.options);
        this._core.$element.on(this._handlers);
        this._core.$element.on("click.owl.video", ".owl-video-play-icon", a.proxy(function (g) {
            this.play(g)
        }, this))
    };
    d.Defaults = {video: false, videoHeight: false, videoWidth: false};
    d.prototype.fetch = function (i, h) {
        var j = (function () {
                if (i.attr("data-vimeo-id")) {
                    return "vimeo"
                } else {
                    if (i.attr("data-vzaar-id")) {
                        return "vzaar"
                    } else {
                        return "youtube"
                    }
                }
            })(), g = i.attr("data-vimeo-id") || i.attr("data-youtube-id") || i.attr("data-vzaar-id"),
            l = i.attr("data-width") || this._core.settings.videoWidth,
            f = i.attr("data-height") || this._core.settings.videoHeight, k = i.attr("href");
        if (k) {
            g = k.match(/(http:|https:|)\/\/(player.|www.|app.)?(vimeo\.com|youtu(be\.com|\.be|be\.googleapis\.com|be\-nocookie\.com)|vzaar\.com)\/(video\/|videos\/|embed\/|channels\/.+\/|groups\/.+\/|watch\?v=|v\/)?([A-Za-z0-9._%-]*)(\&\S+)?/);
            if (g[3].indexOf("youtu") > -1) {
                j = "youtube"
            } else {
                if (g[3].indexOf("vimeo") > -1) {
                    j = "vimeo"
                } else {
                    if (g[3].indexOf("vzaar") > -1) {
                        j = "vzaar"
                    } else {
                        throw new Error("Video URL not supported.")
                    }
                }
            }
            g = g[6]
        } else {
            throw new Error("Missing video URL.")
        }
        this._videos[k] = {type: j, id: g, width: l, height: f};
        h.attr("data-video", k);
        this.thumbnail(i, this._videos[k])
    };
    d.prototype.thumbnail = function (n, p) {
        var o, i, k, h = p.width && p.height ? "width:" + p.width + "px;height:" + p.height + "px;" : "",
            g = n.find("img"), m = "src", j = "", l = this._core.settings, f = function (q) {
                i = '<div class="owl-video-play-icon"></div>';
                if (l.lazyLoad) {
                    o = a("<div/>", {"class": "owl-video-tn " + j, srcType: q})
                } else {
                    o = a("<div/>", {"class": "owl-video-tn", style: "opacity:1;background-image:url(" + q + ")"})
                }
                n.after(o);
                n.after(i)
            };
        n.wrap(a("<div/>", {"class": "owl-video-wrapper", style: h}));
        if (this._core.settings.lazyLoad) {
            m = "data-src";
            j = "owl-lazy"
        }
        if (g.length) {
            f(g.attr(m));
            g.remove();
            return false
        }
        if (p.type === "youtube") {
            k = "//img.youtube.com/vi/" + p.id + "/hqdefault.jpg";
            f(k)
        } else {
            if (p.type === "vimeo") {
                a.ajax({
                    type: "GET",
                    url: "//vimeo.com/api/v2/video/" + p.id + ".json",
                    jsonp: "callback",
                    dataType: "jsonp",
                    success: function (q) {
                        k = q[0].thumbnail_large;
                        f(k)
                    }
                })
            } else {
                if (p.type === "vzaar") {
                    a.ajax({
                        type: "GET",
                        url: "//vzaar.com/api/videos/" + p.id + ".json",
                        jsonp: "callback",
                        dataType: "jsonp",
                        success: function (q) {
                            k = q.framegrab_url;
                            f(k)
                        }
                    })
                }
            }
        }
    };
    d.prototype.stop = function () {
        this._core.trigger("stop", null, "video");
        this._playing.find(".owl-video-frame").remove();
        this._playing.removeClass("owl-video-playing");
        this._playing = null;
        this._core.leave("playing");
        this._core.trigger("stopped", null, "video")
    };
    d.prototype.play = function (f) {
        var k = a(f.target), j = k.closest("." + this._core.settings.itemClass), l = this._videos[j.attr("data-video")],
            m = l.width || "100%", g = l.height || this._core.$stage.height(), h, i;
        if (this._playing) {
            return
        }
        this._core.enter("playing");
        this._core.trigger("play", null, "video");
        j = this._core.items(this._core.relative(j.index()));
        this._core.reset(j.index());
        h = a('<iframe frameborder="0" allowfullscreen mozallowfullscreen webkitAllowFullScreen ></iframe>');
        h.attr("height", g);
        h.attr("width", m);
        if (l.type === "youtube") {
            h.attr("src", "//www.youtube.com/embed/" + l.id + "?autoplay=1&rel=0&v=" + l.id)
        } else {
            if (l.type === "vimeo") {
                h.attr("src", "//player.vimeo.com/video/" + l.id + "?autoplay=1")
            } else {
                if (l.type === "vzaar") {
                    h.attr("src", "//view.vzaar.com/" + l.id + "/player?autoplay=true")
                }
            }
        }
        i = a(h).wrap('<div class="owl-video-frame" />').insertAfter(j.find(".owl-video"));
        this._playing = j.addClass("owl-video-playing")
    };
    d.prototype.isInFullScreen = function () {
        var f = b.fullscreenElement || b.mozFullScreenElement || b.webkitFullscreenElement;
        return f && a(f).parent().hasClass("owl-video-frame")
    };
    d.prototype.destroy = function () {
        var f, g;
        this._core.$element.off("click.owl.video");
        for (f in this._handlers) {
            this._core.$element.off(f, this._handlers[f])
        }
        for (g in Object.getOwnPropertyNames(this)) {
            typeof this[g] != "function" && (this[g] = null)
        }
    };
    a.fn.owlCarousel.Constructor.Plugins.Video = d
})(window.Zepto || window.jQuery, window, document);
(function (a, e, c, d) {
    var b = function (f) {
        this.core = f;
        this.core.options = a.extend({}, b.Defaults, this.core.options);
        this.swapping = true;
        this.previous = d;
        this.next = d;
        this.handlers = {
            "change.owl.carousel": a.proxy(function (g) {
                if (g.namespace && g.property.name == "position") {
                    this.previous = this.core.current();
                    this.next = g.property.value
                }
            }, this), "drag.owl.carousel dragged.owl.carousel translated.owl.carousel": a.proxy(function (g) {
                if (g.namespace) {
                    this.swapping = g.type == "translated"
                }
            }, this), "translate.owl.carousel": a.proxy(function (g) {
                if (g.namespace && this.swapping && (this.core.options.animateOut || this.core.options.animateIn)) {
                    this.swap()
                }
            }, this)
        };
        this.core.$element.on(this.handlers)
    };
    b.Defaults = {animateOut: false, animateIn: false};
    b.prototype.swap = function () {
        if (this.core.settings.items !== 1) {
            return
        }
        if (!a.support.animation || !a.support.transition) {
            return
        }
        this.core.speed(0);
        var h, f = a.proxy(this.clear, this), k = this.core.$stage.children().eq(this.previous),
            i = this.core.$stage.children().eq(this.next), g = this.core.settings.animateIn,
            j = this.core.settings.animateOut;
        if (this.core.current() === this.previous) {
            return
        }
        if (j) {
            h = this.core.coordinates(this.previous) - this.core.coordinates(this.next);
            k.one(a.support.animation.end, f).css({left: h + "px"}).addClass("animated owl-animated-out").addClass(j)
        }
        if (g) {
            i.one(a.support.animation.end, f).addClass("animated owl-animated-in").addClass(g)
        }
    };
    b.prototype.clear = function (f) {
        a(f.target).css({left: ""}).removeClass("animated owl-animated-out owl-animated-in").removeClass(this.core.settings.animateIn).removeClass(this.core.settings.animateOut);
        this.core.onTransitionEnd()
    };
    b.prototype.destroy = function () {
        var f, g;
        for (f in this.handlers) {
            this.core.$element.off(f, this.handlers[f])
        }
        for (g in Object.getOwnPropertyNames(this)) {
            typeof this[g] != "function" && (this[g] = null)
        }
    };
    a.fn.owlCarousel.Constructor.Plugins.Animate = b
})(window.Zepto || window.jQuery, window, document);
(function (a, e, c, d) {
    var b = function (f) {
        this._core = f;
        this._call = null;
        this._time = 0;
        this._timeout = 0;
        this._paused = true;
        this._handlers = {
            "changed.owl.carousel": a.proxy(function (g) {
                if (g.namespace && g.property.name === "settings") {
                    if (this._core.settings.autoplay) {
                        this.play()
                    } else {
                        this.stop()
                    }
                } else {
                    if (g.namespace && g.property.name === "position" && this._paused) {
                        this._time = 0
                    }
                }
            }, this), "initialized.owl.carousel": a.proxy(function (g) {
                if (g.namespace && this._core.settings.autoplay) {
                    this.play()
                }
            }, this), "play.owl.autoplay": a.proxy(function (g, i, h) {
                if (g.namespace) {
                    this.play(i, h)
                }
            }, this), "stop.owl.autoplay": a.proxy(function (g) {
                if (g.namespace) {
                    this.stop()
                }
            }, this), "mouseover.owl.autoplay": a.proxy(function () {
                if (this._core.settings.autoplayHoverPause && this._core.is("rotating")) {
                    this.pause()
                }
            }, this), "mouseleave.owl.autoplay": a.proxy(function () {
                if (this._core.settings.autoplayHoverPause && this._core.is("rotating")) {
                    this.play()
                }
            }, this), "touchstart.owl.core": a.proxy(function () {
                if (this._core.settings.autoplayHoverPause && this._core.is("rotating")) {
                    this.pause()
                }
            }, this), "touchend.owl.core": a.proxy(function () {
                if (this._core.settings.autoplayHoverPause) {
                    this.play()
                }
            }, this)
        };
        this._core.$element.on(this._handlers);
        this._core.options = a.extend({}, b.Defaults, this._core.options)
    };
    b.Defaults = {autoplay: false, autoplayTimeout: 5000, autoplayHoverPause: false, autoplaySpeed: false};
    b.prototype._next = function (f) {
        this._call = e.setTimeout(a.proxy(this._next, this, f), this._timeout * (Math.round(this.read() / this._timeout) + 1) - this.read());
        if (this._core.is("interacting") || c.hidden) {
            return
        }
        this._core.next(f || this._core.settings.autoplaySpeed)
    };
    b.prototype.read = function () {
        return new Date().getTime() - this._time
    };
    b.prototype.play = function (h, g) {
        var f;
        if (!this._core.is("rotating")) {
            this._core.enter("rotating")
        }
        h = h || this._core.settings.autoplayTimeout;
        f = Math.min(this._time % (this._timeout || h), h);
        if (this._paused) {
            this._time = this.read();
            this._paused = false
        } else {
            e.clearTimeout(this._call)
        }
        this._time += this.read() % h - f;
        this._timeout = h;
        this._call = e.setTimeout(a.proxy(this._next, this, g), h - f)
    };
    b.prototype.stop = function () {
        if (this._core.is("rotating")) {
            this._time = 0;
            this._paused = true;
            e.clearTimeout(this._call);
            this._core.leave("rotating")
        }
    };
    b.prototype.pause = function () {
        if (this._core.is("rotating") && !this._paused) {
            this._time = this.read();
            this._paused = true;
            e.clearTimeout(this._call)
        }
    };
    b.prototype.destroy = function () {
        var f, g;
        this.stop();
        for (f in this._handlers) {
            this._core.$element.off(f, this._handlers[f])
        }
        for (g in Object.getOwnPropertyNames(this)) {
            typeof this[g] != "function" && (this[g] = null)
        }
    };
    a.fn.owlCarousel.Constructor.Plugins.autoplay = b
})(window.Zepto || window.jQuery, window, document);
(function (a, e, b, d) {
    var c = function (f) {
        this._core = f;
        this._initialized = false;
        this._pages = [];
        this._controls = {};
        this._templates = [];
        this.$element = this._core.$element;
        this._overrides = {next: this._core.next, prev: this._core.prev, to: this._core.to};
        this._handlers = {
            "prepared.owl.carousel": a.proxy(function (g) {
                if (g.namespace && this._core.settings.dotsData) {
                    this._templates.push('<div class="' + this._core.settings.dotClass + '">' + a(g.content).find("[data-dot]").addBack("[data-dot]").attr("data-dot") + "</div>")
                }
            }, this), "added.owl.carousel": a.proxy(function (g) {
                if (g.namespace && this._core.settings.dotsData) {
                    this._templates.splice(g.position, 0, this._templates.pop())
                }
            }, this), "remove.owl.carousel": a.proxy(function (g) {
                if (g.namespace && this._core.settings.dotsData) {
                    this._templates.splice(g.position, 1)
                }
            }, this), "changed.owl.carousel": a.proxy(function (g) {
                if (g.namespace && g.property.name == "position") {
                    this.draw()
                }
            }, this), "initialized.owl.carousel": a.proxy(function (g) {
                if (g.namespace && !this._initialized) {
                    this._core.trigger("initialize", null, "navigation");
                    this.initialize();
                    this.update();
                    this.draw();
                    this._initialized = true;
                    this._core.trigger("initialized", null, "navigation")
                }
            }, this), "refreshed.owl.carousel": a.proxy(function (g) {
                if (g.namespace && this._initialized) {
                    this._core.trigger("refresh", null, "navigation");
                    this.update();
                    this.draw();
                    this._core.trigger("refreshed", null, "navigation")
                }
            }, this)
        };
        this._core.options = a.extend({}, c.Defaults, this._core.options);
        this.$element.on(this._handlers)
    };
    c.Defaults = {
        nav: false,
        navText: ['<span aria-label="Previous">&#x2190;</span>', '<span aria-label="Next">&#x2192;</span>'],
        navSpeed: false,
        navElement: 'button type="button" role="presentation"',
        navContainer: false,
        navContainerClass: "owl-nav",
        navClass: ["owl-prev", "owl-next"],
        slideBy: 1,
        dotClass: "owl-dot",
        dotsClass: "owl-dots",
        dots: true,
        dotsEach: false,
        dotsData: false,
        dotsSpeed: false,
        dotsContainer: false
    };
    c.prototype.initialize = function () {
        var f, g = this._core.settings;
        this._controls.$relative = (g.navContainer ? a(g.navContainer) : a("<div>").addClass(g.navContainerClass).appendTo(this.$element)).addClass("disabled");
        this._controls.$previous = a("<" + g.navElement + ">").addClass(g.navClass[0]).html(g.navText[0]).prependTo(this._controls.$relative).on("click", a.proxy(function (h) {
            this.prev(g.navSpeed)
        }, this));
        this._controls.$next = a("<" + g.navElement + ">").addClass(g.navClass[1]).html(g.navText[1]).appendTo(this._controls.$relative).on("click", a.proxy(function (h) {
            this.next(g.navSpeed)
        }, this));
        if (!g.dotsData) {
            this._templates = [a('<button role="button">').addClass(g.dotClass).append(a("<span>")).prop("outerHTML")]
        }
        this._controls.$absolute = (g.dotsContainer ? a(g.dotsContainer) : a("<div>").addClass(g.dotsClass).appendTo(this.$element)).addClass("disabled");
        this._controls.$absolute.on("click", "button", a.proxy(function (h) {
            var i = a(h.target).parent().is(this._controls.$absolute) ? a(h.target).index() : a(h.target).parent().index();
            h.preventDefault();
            this.to(i, g.dotsSpeed)
        }, this));
        for (f in this._overrides) {
            this._core[f] = a.proxy(this[f], this)
        }
    };
    c.prototype.destroy = function () {
        var g, f, i, h, j;
        j = this._core.settings;
        for (g in this._handlers) {
            this.$element.off(g, this._handlers[g])
        }
        for (f in this._controls) {
            if (f === "$relative" && j.navContainer) {
                this._controls[f].html("")
            } else {
                this._controls[f].remove()
            }
        }
        for (h in this.overides) {
            this._core[h] = this._overrides[h]
        }
        for (i in Object.getOwnPropertyNames(this)) {
            typeof this[i] != "function" && (this[i] = null)
        }
    };
    c.prototype.update = function () {
        var f, g, h, l = this._core.clones().length / 2, p = l + this._core.items().length,
            m = this._core.maximum(true), n = this._core.settings,
            o = n.center || n.autoWidth || n.dotsData ? 1 : n.dotsEach || n.items;
        if (n.slideBy !== "page") {
            n.slideBy = Math.min(n.slideBy, n.items)
        }
        if (n.dots || n.slideBy == "page") {
            this._pages = [];
            for (f = l, g = 0, h = 0; f < p; f++) {
                if (g >= o || g === 0) {
                    this._pages.push({start: Math.min(m, f - l), end: f - l + o - 1});
                    if (Math.min(m, f - l) === m) {
                        break
                    }
                    g = 0, ++h
                }
                g += this._core.mergers(this._core.relative(f))
            }
        }
    };
    c.prototype.draw = function () {
        var f, j = this._core.settings, g = this._core.items().length <= j.items,
            h = this._core.relative(this._core.current()), i = j.loop || j.rewind;
        this._controls.$relative.toggleClass("disabled", !j.nav || g);
        if (j.nav) {
            this._controls.$previous.toggleClass("disabled", !i && h <= this._core.minimum(true));
            this._controls.$next.toggleClass("disabled", !i && h >= this._core.maximum(true))
        }
        this._controls.$absolute.toggleClass("disabled", !j.dots || g);
        if (j.dots) {
            f = this._pages.length - this._controls.$absolute.children().length;
            if (j.dotsData && f !== 0) {
                this._controls.$absolute.html(this._templates.join(""))
            } else {
                if (f > 0) {
                    this._controls.$absolute.append(new Array(f + 1).join(this._templates[0]))
                } else {
                    if (f < 0) {
                        this._controls.$absolute.children().slice(f).remove()
                    }
                }
            }
            this._controls.$absolute.find(".active").removeClass("active");
            this._controls.$absolute.children().eq(a.inArray(this.current(), this._pages)).addClass("active")
        }
    };
    c.prototype.onTrigger = function (f) {
        var g = this._core.settings;
        f.page = {
            index: a.inArray(this.current(), this._pages),
            count: this._pages.length,
            size: g && (g.center || g.autoWidth || g.dotsData ? 1 : g.dotsEach || g.items)
        }
    };
    c.prototype.current = function () {
        var f = this._core.relative(this._core.current());
        return a.grep(this._pages, a.proxy(function (h, g) {
            return h.start <= f && h.end >= f
        }, this)).pop()
    };
    c.prototype.getPosition = function (i) {
        var g, f, h = this._core.settings;
        if (h.slideBy == "page") {
            g = a.inArray(this.current(), this._pages);
            f = this._pages.length;
            i ? ++g : --g;
            g = this._pages[((g % f) + f) % f].start
        } else {
            g = this._core.relative(this._core.current());
            f = this._core.items().length;
            i ? g += h.slideBy : g -= h.slideBy
        }
        return g
    };
    c.prototype.next = function (f) {
        a.proxy(this._overrides.to, this._core)(this.getPosition(true), f)
    };
    c.prototype.prev = function (f) {
        a.proxy(this._overrides.to, this._core)(this.getPosition(false), f)
    };
    c.prototype.to = function (g, h, i) {
        var f;
        if (!i && this._pages.length) {
            f = this._pages.length;
            a.proxy(this._overrides.to, this._core)(this._pages[((g % f) + f) % f].start, h)
        } else {
            a.proxy(this._overrides.to, this._core)(g, h)
        }
    };
    a.fn.owlCarousel.Constructor.Plugins.Navigation = c
})(window.Zepto || window.jQuery, window, document);
(function (a, e, b, d) {
    var c = function (f) {
        this._core = f;
        this._hashes = {};
        this.$element = this._core.$element;
        this._handlers = {
            "initialized.owl.carousel": a.proxy(function (g) {
                if (g.namespace && this._core.settings.startPosition === "URLHash") {
                    a(e).trigger("hashchange.owl.navigation")
                }
            }, this), "prepared.owl.carousel": a.proxy(function (g) {
                if (g.namespace) {
                    var h = a(g.content).find("[data-hash]").addBack("[data-hash]").attr("data-hash");
                    if (!h) {
                        return
                    }
                    this._hashes[h] = g.content
                }
            }, this), "changed.owl.carousel": a.proxy(function (h) {
                if (h.namespace && h.property.name === "position") {
                    var g = this._core.items(this._core.relative(this._core.current())),
                        i = a.map(this._hashes, function (k, j) {
                            return k === g ? j : null
                        }).join();
                    if (!i || e.location.hash.slice(1) === i) {
                        return
                    }
                    e.location.hash = i
                }
            }, this)
        };
        this._core.options = a.extend({}, c.Defaults, this._core.options);
        this.$element.on(this._handlers);
        a(e).on("hashchange.owl.navigation", a.proxy(function (g) {
            var h = e.location.hash.substring(1), i = this._core.$stage.children(),
                j = this._hashes[h] && i.index(this._hashes[h]);
            if (j === d || j === this._core.current()) {
                return
            }
            this._core.to(this._core.relative(j), false, true)
        }, this))
    };
    c.Defaults = {URLhashListener: false};
    c.prototype.destroy = function () {
        var f, g;
        a(e).off("hashchange.owl.navigation");
        for (f in this._handlers) {
            this._core.$element.off(f, this._handlers[f])
        }
        for (g in Object.getOwnPropertyNames(this)) {
            typeof this[g] != "function" && (this[g] = null)
        }
    };
    a.fn.owlCarousel.Constructor.Plugins.Hash = c
})(window.Zepto || window.jQuery, window, document);
(function (a, j, b, i) {
    var f = a("<support>").get(0).style, e = "Webkit Moz O ms".split(" "), c = {
        transition: {
            end: {
                WebkitTransition: "webkitTransitionEnd",
                MozTransition: "transitionend",
                OTransition: "oTransitionEnd",
                transition: "transitionend"
            }
        },
        animation: {
            end: {
                WebkitAnimation: "webkitAnimationEnd",
                MozAnimation: "animationend",
                OAnimation: "oAnimationEnd",
                animation: "animationend"
            }
        }
    }, h = {
        csstransforms: function () {
            return !!g("transform")
        }, csstransforms3d: function () {
            return !!g("perspective")
        }, csstransitions: function () {
            return !!g("transition")
        }, cssanimations: function () {
            return !!g("animation")
        }
    };

    function g(l, k) {
        var m = false, n = l.charAt(0).toUpperCase() + l.slice(1);
        a.each((l + " " + e.join(n + " ") + n).split(" "), function (o, p) {
            if (f[p] !== i) {
                m = k ? p : true;
                return false
            }
        });
        return m
    }

    function d(k) {
        return g(k, true)
    }

    if (h.csstransitions()) {
        a.support.transition = new String(d("transition"));
        a.support.transition.end = c.transition.end[a.support.transition]
    }
    if (h.cssanimations()) {
        a.support.animation = new String(d("animation"));
        a.support.animation.end = c.animation.end[a.support.animation]
    }
    if (h.csstransforms()) {
        a.support.transform = new String(d("transform"));
        a.support.transform3d = h.csstransforms3d()
    }
})(window.Zepto || window.jQuery, window, document);