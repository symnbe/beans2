// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import '@fortawesome/fontawesome-free/js/all'
import Swiper from 'swiper/swiper-bundle'
import "../stylesheets/application"

Rails.start()
// Turbolinks.start()
ActiveStorage.start()

// $(document).on('turbolinks:load', function() {
  $(document).ready(function () {
    $(".openbtn").click(function () { //ボタンがクリックされたら
    	$(this).toggleClass('active'); //ボタン自身に activeクラスを付与し
      $("#g-nav").toggleClass('panelactive'); //ナビゲーションにpanelactiveクラスを付与
    });

    $("#g-nav a").click(function () { //ナビゲーションのリンクがクリックされたら
      $(".openbtn").removeClass('active'); //ボタンの activeクラスを除去し
      $("#g-nav").removeClass('panelactive'); //ナビゲーションのpanelactiveクラスも除去
    });

    $('#search-button').click(function (event) {
      console.log('CLICK!');
      $(".search-bar").toggleClass("d-none");
      event.preventDefault();
    });

    new Swiper('.swiper', {
      loop: true,
      autoplay: {
        delay: 5000,
        disableOnInteraction: false
      },
      speed: 1500,
    });

  });

  $(window).on('load',function(){
    $("#splash-logo").delay(1000).fadeOut('slow');//ロゴを1.2秒でフェードアウトする記述

    //=====ここからローディングエリア（splashエリア）を1.5秒でフェードアウトした後に動かしたいJSをまとめる
    $("#splash").delay(1000).fadeOut('slow',function(){//ローディングエリア（splashエリア）を1.5秒でフェードアウトする記述

    $('body').addClass('appear');//フェードアウト後bodyにappearクラス付与

    });
    //=====ここまでローディングエリア（splashエリア）を1.5秒でフェードアウトした後に動かしたいJSをまとめる

    //=====ここから背景が伸びた後に動かしたいJSをまとめたい場合は
    $('.splashbg').on('animationend', function() {
    //この中に動かしたいJSを記載
    });
    //=====ここまで背景が伸びた後に動かしたいJSをまとめる

  });

//   function initMap(){
//     let map = new google.maps.Map(document.getElementById('map'), {
//     center: {lat: <%= @post.latitude %>, lng: <%= @post.longitude %> },
//     zoom: 15
//     });
// }