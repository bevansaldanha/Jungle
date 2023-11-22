
describe('example to-do app', () => {
  before(() => {
    cy.visit('http://localhost:3000/')
    
  })
  
  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");

  });
  it("There is 12 products on the page", () => {
    cy.get(".products article").should("have.length", 12);
  });

  it("There is 12 products on the page", () => {
    cy.get('.products article').first().click()
    cy.get('.product-detail h1').should('have.text', 'Cliff Collard')
  });

})