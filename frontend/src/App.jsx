import React, { useState, useCallback } from 'react';
import Router from './Router'
import  { Header } from "./components/Header";
import  { Footer } from "./components/Footer";

const App = () => {
  return (
      <div>
          <Header />
          <main className="c-main">
              <Router />
          </main>
          <Footer />
      </div>
  );
};

export default App;
