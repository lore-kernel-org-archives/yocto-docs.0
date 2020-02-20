Received: from smtp1.axis.com (smtp1.axis.com [])
 by mx.groups.io with SMTP id smtpd.web10.1747.1582230461848926578
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 12:27:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=TLjtsiWD;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1692; q=dns/txt; s=axis-central1;
  t=1582230464; x=1613766464;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ENrRtG89ZIX8x+74SWQHLvNu7MEi70/Pmh7uBFzpfLI=;
  b=TLjtsiWDz7ZJYIVfyv/dMve/bUjk4L7LzrAfdqOURxaKHUL97VfHcX2w
   YWWxMHttMKCGL9IXo1wkCN5mpRQX7/gvlHaUrosSL9flnRkY0In0EuV1d
   68K90OHnrOwj54pveumBniSl74CWY8CvJWJ+q/PuGdvGmu5zXnuwtxHA5
   vl7gkL3BOAa/rf06B6woLRehwJYI42SvPvRK1NxQQuFQGygVnbiFphelg
   CDevu4uy1eh7jXE8DDgZIFZP+0XYG+C2wTMT4CWnB15mvYVa1AUKXSPu4
   0TidOjvpPlOkHHvadOMYaC5gEjsxXdXy8OW++tNyv7kDN9duJ0Kf/3WZi
   g==;
IronPort-SDR: Qt/+fIceVUgqGbbySJfKKWFb44sH3Jt6dwsCRbZp4cI9mHHEvuMFnU23iyB+++pn3p92a9l+Sr
 yvzAado8chU/9EGGkhJW7+ccdcQsRYJ8+LVu3wpw+29yoEDQw+qWuL/tqS84uNe2tApzOb3WPT
 mC8CCur9ChlzePAuomlqubjQ8xsOQsvEcXCin2zTThZKtP1HvWS74w5guW/nFI8BvXLDAHUkJo
 ZHWU5g5zdQrlFyzsSgcvdovUl2/XvArO8+lFXACdZIAuKue/Nx7yxPX8UIgNEkuw3l6ocn73Fr
 0no=
X-IronPort-AV: E=Sophos;i="5.70,465,1574118000"; 
   d="scan'208";a="5657851"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <docs@lists.yoctoproject.org>
Subject: [Resend][PATCH 5/5] ref-manual: Add a tips on how to achieve whitelisting of licenses
Date: Thu, 20 Feb 2020 21:27:33 +0100
Message-ID: <20200220202733.21907-5-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200220202733.21907-1-pkj@axis.com>
References: <20200220202733.21907-1-pkj@axis.com>
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

It is sometimes more appropriate to define the licenses that are
allowed to be used rather than the ones that are not permitted. This
adds a tips on how this can be achieved by using AVAILABLE_LICENSES
and some Python set arithmetics.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 documentation/ref-manual/ref-variables.xml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 9e6d37ec0d..7ab37de317 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -6774,6 +6774,25 @@
                     components that are required to produce a functional system
                     image.
                 </note>
+
+                <note><title>Tips</title>
+                    It is possible to define a list of licenses that are allowed
+                    to be used instead of the licenses that are excluded. To do
+                    this, define a
+                    variable <filename>COMPATIBLE_LICENSES</filename> with the
+                    names of the licences that are allowed. Then
+                    define <filename>INCOMPATIBLE_LICENSE</filename> as:
+                    <literallayout class='monospaced'>
+     INCOMPATIBLE_LICENSE = "${@' '.join(sorted(set(d.getVar('AVAILABLE_LICENSES').split()) - set(d.getVar('COMPATIBLE_LICENSES').split())))}"
+                    </literallayout>
+                    This will result
+                    in <filename>INCOMPATIBLE_LICENSE</filename> containing the
+                    names of all licences
+                    from <link linkend='var-AVAILABLE_LICENSES'><filename>AVAILABLE_LICENSES</filename></link>
+                    except the ones specified
+                    in <filename>COMPATIBLE_LICENSES</filename>, thus only
+                    allowing the latter licences to be used.
+                </note>
             </glossdef>
         </glossentry>
 
-- 
2.21.1

