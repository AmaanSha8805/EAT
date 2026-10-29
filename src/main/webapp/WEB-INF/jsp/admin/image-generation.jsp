<%@ include file="../header.jsp" %>

<section class="section">
    <div class="container">
        <div class="section-title">
            <h2>Food Image Generation</h2>
            <p>Batch generate photorealistic images for food items using Google Gemini Imagen API</p>
        </div>

        <% if (!generated) { %>
            <div class="card">
                <h3>Generate Images</h3>
                <p class="mb-3">
                    This will generate photorealistic images for up to <strong>${limit}</strong> food items that currently don't have images.
                    Each image will be generated using the food's name and cuisine type as the prompt.
                </p>
                <div class="alert alert-info mb-3">
                    <strong>Important:</strong>
                    <ul>
                        <li>Ensure the <code>GEMINI_API_KEY</code> environment variable is set on the server</li>
                        <li>Images are saved to <code>images/foods/</code> directory</li>
                        <li>Cost: Approximately $0.04 per image (Imagen 4)</li>
                        <li>Rate limiting: 1 request per second between generations</li>
                        <li>Retry logic: 3 attempts with exponential backoff</li>
                    </ul>
                </div>
                <form method="POST" action="<%= request.getContextPath() %>/admin/image-generation">
                    <button type="submit" class="btn btn-primary">
                        Generate Images for ${limit} Items
                    </button>
                </form>
            </div>
        <% } else { %>
            <div class="card">
                <h3>Generation Results</h3>
                
                <% if (results != null && !results.isEmpty()) { %>
                    <div class="mb-3">
                        <strong>Total items processed:</strong> ${results.size()}
                    </div>
                    
                    <% int successCount = 0; %>
                    <% for (com.eat.service.ImageGenerationService.GenerationResult result : results) { %>
                        <% if (result.success) { successCount++; } %>
                    <% } %>
                    
                    <div class="alert <%= successCount == results.size() ? "alert-success" : "alert-warning" %> mb-3">
                        <strong>Summary:</strong> ${successCount} successful, ${results.size() - successCount} failed
                    </div>
                    
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Food ID</th>
                                    <th>Food Name</th>
                                    <th>Status</th>
                                    <th>Image Path</th>
                                    <th>Message</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (com.eat.service.ImageGenerationService.GenerationResult result : results) { %>
                                    <tr class="<%= result.success ? "table-success" : "table-danger" %>">
                                        <td>${result.foodId}</td>
                                        <td>${result.foodName}</td>
                                        <td>
                                            <%= result.success ? 
                                                "<span class=\"badge badge-success\">Success</span>" : 
                                                "<span class=\"badge badge-danger\">Failed</span>" %>
                                        </td>
                                        <td>
                                            <%= result.imageUrl != null ? result.imageUrl : "-" %>
                                        </td>
                                        <td>
                                            <%= result.success ? result.infoMessage : result.errorMessage %>
                                        </td>
                                    </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                    
                    <div class="mt-3">
                        <a href="<%= request.getContextPath() %>/admin/image-generation" class="btn btn-secondary">
                            Generate More Images
                        </a>
                        <a href="<%= request.getContextPath() %>/admin/dashboard" class="btn btn-primary">
                            Back to Dashboard
                        </a>
                    </div>
                <% } else { %>
                    <div class="alert alert-warning">
                        No results returned from generation service.
                    </div>
                    <a href="<%= request.getContextPath() %>/admin/image-generation" class="btn btn-secondary">
                        Try Again
                    </a>
                <% } %>
            </div>
        <% } %>
    </div>
</section>

<%@ include file="../footer.jsp" %>
