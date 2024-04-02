document.addEventListener("DOMContentLoaded", function() {

    let timeoutId;
    document.getElementById('employee_salary').addEventListener('input', function() {
      clearTimeout(timeoutId);
  
      timeoutId = setTimeout(async function() {
        const salary = parseFloat(document.getElementById('employee_salary').value);
        console.log(salary);
        const inss_discount = await calculate_INSS_discount(salary)    
        const inss_discount_display = document.getElementById('employee_inss_discount_display');
        if (inss_discount > 0) {
            inss_discount_display.value = inss_discount;
            document.getElementById('employee_inss_discount').value = inss_discount;
        }
      }, 1000);
    });
  });
  
  async function calculate_INSS_discount(salary) {
      const data = {
        salary: salary
      };
    
      const options = {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
      };
      
      try {
        const response = await fetch('/calculate-contribution', options);
    
        if (!response.ok) {
          throw new Error('Erro ao calcular o desconto do INSS');
        }
  
        const responseData = await response.json();
        return responseData.inss_discount;
      } catch (error) {
        throw error; // Rejeita a promessa com o erro
      }
  }