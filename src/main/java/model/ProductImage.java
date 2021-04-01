package model;

public class ProductImage {
    String base64;
    String fileName;

    public ProductImage() {
    }

    public ProductImage(String base64, String fileName) {
        this.base64 = base64;
        this.fileName = fileName;
    }

    public String getBase64() {
        return base64;
    }

    public void setBase64(String base64) {
        this.base64 = base64;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
}
