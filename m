Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.22846.1581346289965454009
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 06:51:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
IronPort-SDR: IVZTUMpjyggqimuxdbfmJrz96M7pzlBltUvKqClIpEmwkw1aRsyGHby+Srqw6dB9FWJGnlKdaa
 XuKjchXSc/+84Kl1XmZ/jkAXLvNiNsY2QV8WG4VMPTpmcZUWFdc6EJNm3NTMpdsB9dtZ++PeHN
 gwSLqRrMOqcbO4ix/aPwCStsMLD7StM+vS8jeEiaHhRWTlYp8bKkfDQH3IdopYpBygCv2466te
 Efyf2SWiabgpRnaXMd8ON62/phHcm2Y8iJUO1yUMrv4i36nqzPDtxGPEkdD1PAjpDNaClM8isL
 /Go=
X-IronPort-AV: E=Sophos;i="5.70,425,1574118000"; 
   d="scan'208";a="5115582"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <docs@lists.yoctoproject.org>
Subject: [master][zeus][PATCH 5/5] ref-manual: Add a tips on how to achieve whitelisting of licenses
Date: Mon, 10 Feb 2020 15:51:21 +0100
Message-ID: <20200210145121.18307-5-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200210145121.18307-1-pkj@axis.com>
References: <20200210145121.18307-1-pkj@axis.com>
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

