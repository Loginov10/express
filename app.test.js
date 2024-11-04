const request = require('supertest');
const express = require('express');
const app = require('../app'); // Подключаем ваше приложение

describe('GET /', function() {
  it('responds with status 200 and text "Hello World"', function(done) {
    request(app)
      .get('/')
      .expect(200) // Ожидаем статус 200
      .expect('Hello World') // Ожидаем текст 'Hello World' в ответе
      .end(done);
  });
});

