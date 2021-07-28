<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/NewsList">
        <div class="wrap-acr">
            <xsl:apply-templates select="News"></xsl:apply-templates>
        </div>
    </xsl:template>
    <xsl:template match="News">
        <div class="title-acr">
            <p>
                <span>
                    <xsl:if test="position()&gt;0 and position()&lt;10">
                        <xsl:text disable-output-escaping="yes">0</xsl:text>
                        <xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
                    </xsl:if>
                    <xsl:if test="position()&gt;10">
                        <xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
                    </xsl:if>
                </span>
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
            </p>
        </div>
        <div class="content-acr">
            <p>Là người trực tiếp phục vụ thức ăn đến khách hàng, TOKYO Deli  luôn luôn ý thức được trách nhiệm của mình đối với sức khỏe của người tiêu dùng. Vì vậy, TOKYO Deli  đã xây dựng một hệ thống kiểm soát chất lượng và an toàn thực phẩm rất nghiêm ngặt, quy trình trình chế biến cũng được áp dụng các nguyên tắc thân thiện với môi trường để đảm bảo cung cấp cho khách hàng các sản phẩm sạch và xanh.</p>
        </div>
    </xsl:template>
</xsl:stylesheet>