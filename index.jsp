<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-md">
            <h1 class="text-center">Conversor de Divisas a Peso (COP)</h1>
            <form action="index.jsp" method="post" class="form-inline justify-content-center">
                <div class="form-group mb-2">
                    <h1>Dijita la cantidad y la moneda para convertir a peso colombiano</h1>
                    <input type="text" name="valor" class="form-control" placeholder="Dijita la cantidad">
                </div>
                <div class="form-group mx-sm-3 mb-2">
                    <select name="divisa" class="form-control">
                        <option value="dolares">USD</option>
                        <option value="euros">EUR</option>
                        <option value="Psmexicano">MXN</option>
                        <option value="esterlina">GBP</option>
                    </select>        
                </div>
                <div class="col-auto mb-2">
                    <button type="submit" class="btn btn-primary">Convertir</button>
                </div>
            </form>
            <div class="mt-3">
                <%
                    String valorStr = request.getParameter("valor");
                    String divisa = request.getParameter("divisa");
                    int num1 = valorStr!= null && valorStr.matches("\\d+")? Integer.parseInt(valorStr) : 0;
                    int conversion = 0;
                    int monedaDolar = 3909;
                    int monedaEur = 4251;
                    int monedaMXC = 219;
                    int monedaEsterlina = 4996;

                    if (divisa!= null) {
                        try {
                            switch (divisa) {
                                case "dolares":
                                    conversion = num1 * monedaDolar;
                                    break;
                                case "euros":
                                    conversion = num1 * monedaEur;
                                    break;
                                case "Psmexicano":
                                    conversion = num1 * monedaMXC;
                                    break;
                                case "esterlina":
                                    conversion = num1 * monedaEsterlina;
                                    break;
                                default:
                                    throw new Exception("Moneda no soportada");
                            }
                            out.println("<div class='alert alert-success'>Resultado: " + conversion + "</div>");
                        } catch (Exception e) {
                            out.println("<div class='alert alert-danger'>" + e.getMessage() + "</div>");
                        }
                    }
                %>
            </div>
        </div>
        <!-- Colocas JS aquí -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>
