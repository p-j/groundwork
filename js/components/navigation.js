/*
 *
 *  jQuery ResponsiveNavigation by Gary Hepting
 *  
 *  Open source under the MIT License. 
 *
 *  Copyright © 2013 Gary Hepting. All rights reserved.
 *
*/


(function() {
  var ResponsiveNavigation, delayNavigationClose, responsiveNavigationIndex;

  responsiveNavigationIndex = 0;

  delayNavigationClose = [];

  ResponsiveNavigation = (function() {
    function ResponsiveNavigation(el) {
      this.index = responsiveNavigationIndex++;
      this.el = $(el);
      this.init();
    }

    ResponsiveNavigation.prototype.init = function() {
      this.markers();
      return this.mouseBindings();
    };

    ResponsiveNavigation.prototype.markers = function() {
      return this.el.find('li').each(function() {
        if ($(this).find('ul').length) {
          return $(this).addClass('menu');
        }
      });
    };

    ResponsiveNavigation.prototype.mouseBindings = function() {
      $('body').on('mouseenter', 'li.menu', function() {
        clearTimeout(delayNavigationClose[this.index]);
        $('li.menu ul').removeClass('open');
        return $(this).children('ul').addClass('open');
      });
      return $('body').on('mouseleave', 'li.menu, ul.open', function() {
        var _this = this;
        return delayNavigationClose[this.index] = setTimeout(function() {
          return $(_this).find('ul').removeClass('open');
        }, 500);
      });
    };

    return ResponsiveNavigation;

  })();

  $(function() {
    var responsiveNavigationElements;
    responsiveNavigationElements = [];
    return $('.nav').each(function() {
      return responsiveNavigationElements.push(new ResponsiveNavigation(this));
    });
  });

}).call(this);
