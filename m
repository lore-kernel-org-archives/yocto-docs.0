Received: from smtp2.axis.com (smtp2.axis.com [])
 by mx.groups.io with SMTP id smtpd.web10.1744.1582230457237069046
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 12:27:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=IlHR6+n9;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1655; q=dns/txt; s=axis-central1;
  t=1582230459; x=1613766459;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=w9nd76a9S6l8AquKbfHQR+M90QyPbGygxt6Jj9Kp5ao=;
  b=IlHR6+n9IZDcx2Xu+lv29NGqu6E6zstdOWI3cUOrvmE2I/d0i8+Dt64O
   JnrCb/7S9Q+tmCllesckkD8SM6nHSGtQHafyaR36tK6qpRI3/FJ89sLkm
   95KyQIsOOvYgf1E436PjalCKZrhZ3b6fBy3CH80SqpBlK+vmwIUW0lkTl
   ZTkJheNSToSSjBbuQVzPrtrRJPf5sLB4hmsFNClxopiSZlX0B0RshSV0/
   X/zqm57hUpiAPOlBdGMcIHTd90QFuW6bmetFdVN3xrlFAo3rbu3D0tH/f
   i9SXFaYm8zHnoogzb6nfl8WU5ZVFjXFRE/RVhk+jhr/mb227o5XnjP1Mk
   g==;
IronPort-SDR: Tij47KVSJMgkOhicKc3i9x5X514UdbptTXlQtFPcrG4prYhpnYETPJYoGGG/kdEa48c3WVs/kG
 OtTuTcrRBK25WlHtmuySrZV8TQ7zx0WGHOv9qplTKz8tDywboshGG9hjIUwVu4WW/hQyNq9aX6
 3m2M9XlghNMUm00bkie4O0SSDMJZGRX39xAfqIoeEIbfzJurVZU93zG1z7N7AG/bOEeJLfnp+w
 Nq+rElUi7LR9Z6ef9Q+Ix9eoNFLwPVXHQeycZzF6wpfQVaYAqKJ3pA/166ZKm9FQw/qn8clSx/
 lf8=
X-IronPort-AV: E=Sophos;i="5.70,465,1574118000"; 
   d="scan'208";a="5501092"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <docs@lists.yoctoproject.org>
Subject: [Resend][PATCH 4/5] ref-manual: Add a variable description for AVAILABLE_LICENSES
Date: Thu, 20 Feb 2020 21:27:32 +0100
Message-ID: <20200220202733.21907-4-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200220202733.21907-1-pkj@axis.com>
References: <20200220202733.21907-1-pkj@axis.com>
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 documentation/ref-manual/ref-variables.xml | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index c8ece0c579..9e6d37ec0d 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -495,6 +495,30 @@
             </glossdef>
         </glossentry>
 
+        <glossentry id='var-AVAILABLE_LICENSES'><glossterm>AVAILABLE_LICENSES</glossterm>
+            <info>
+                AVAILABLE_LICENSES[doc] = "List of licenses found in the directories specified by COMMON_LICENSE_DIR and LICENSE_PATH."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
+
+                    List of licenses found in the directories specified
+                    by <link linkend='var-COMMON_LICENSE_DIR'><filename>COMMON_LICENSE_DIR</filename></link>
+                    and <link linkend='var-LICENSE_PATH'><filename>LICENSE_PATH</filename></link>.
+
+                    <note>
+                        It is assumed that all changes
+                        to <filename>COMMON_LICENSE_DIR</filename>
+                        and <filename>LICENSE_PATH</filename> have been done
+                        before <filename>AVAILABLE_LICENSES</filename> is
+                        defined
+                        (in <link linkend='ref-classes-license'>license.bbclass</link>).
+                    </note>
+                </para>
+            </glossdef>
+        </glossentry>
+
         <glossentry id='var-AVAILTUNES'><glossterm>AVAILTUNES</glossterm>
             <info>
                 AVAILTUNES[doc] = "The list of defined CPU and Application Binary Interface (ABI) tunings (i.e.  "tunes") available for use by the OpenEmbedded build system."
-- 
2.21.1

