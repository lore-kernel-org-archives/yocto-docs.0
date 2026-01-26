Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324BBD19525
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 22:28:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33756.1769466490490639925
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Jan 2026 14:28:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=VOOVDWAp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.168.131, mailfrom: daiane.angolini@foundries.io)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgUCf2942983
	for <docs@lists.yoctoproject.org>; Mon, 26 Jan 2026 22:28:10 GMT
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx2682p8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <docs@lists.yoctoproject.org>; Mon, 26 Jan 2026 22:28:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b70d8095daso4727765eec.1
        for <docs@lists.yoctoproject.org>; Mon, 26 Jan 2026 14:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1769466489; x=1770071289; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLG6bnyR0Y+dX0CTeYrYDhKqgTpqVghHhOp9tnjx2lY=;
        b=VOOVDWApb+E7tODnSYouc780A8CBZT0d04PMmKPag1a2Frzhsb1HsdqvqwLdS6hWWp
         EHlhoSeW4Zziu1437sBLZsMPhmmjG1EsF1keKB2TZo22NucxufLCC9tNRXSHy4TBdeQh
         EgCEvGBnfX23d+rlCIRGayDPWtM4muYTGL8VGOeN9eSjsI5u8+JW+w0uD7P0FHF/Rrbe
         e9ZkjMtsqQyS9hBxnXo9+XfL4HP7SXn1KpqfCP5x3bicwtogl2wydAjumGCe5N9QIGRd
         x+cc92q5kNw+Ty4hQi2Bpy/iRUpszx+uaugZ1yqZLGeQs5+kRPd7iIL2NHH1/y688nMy
         xlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769466489; x=1770071289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sLG6bnyR0Y+dX0CTeYrYDhKqgTpqVghHhOp9tnjx2lY=;
        b=dc6plzNwsXNg2eTFEHUI+cp0v9Ts1PT6mJ3AywTAAeLkzMOGi8KiY9Sl10OwXDUslp
         gdRBBk0TwCI9xjcEliJaEmimBn16r+MaXc6SGt4cCW6k6kHgxUzAamzdrUN/SesaR6zr
         pRdGuvdmyOEPHDRRJCHy4kFgHnbmxD9INp+/4qGsLbtiK2jTKywTbIp+peqtHCRoXglW
         wi4NEuMSQen/CfC7p3QNFhjYwKG+eSwtjtKBVDzZqJGiCQEgeA3Fz1dlLYTOe5ApKO0Z
         KccVx1Mo1pNa5thXoWH6+wnuencEKK0R6Na4+bjT77anAKUcnk9txraLtrHP7hmc2Hhd
         mniA==
X-Gm-Message-State: AOJu0YztpW54Z3H+ZeDPo+WM8AkkMBkqHOWf9F7Nc+EyHmNDzQsofmqu
	lJRoGPmYCWl/EePhH5KgapUBfXl1eAQHywKRJCYulKk0OLIYn+ghV9vy8pSweuSItTYGHQyvWeW
	AhcM1xpNchMABG6vZD3p6EgOLIBm9ieK+tV31JcejM5tl8wm8D8AHCuXTWa6gyBNA5MM9a71r
X-Gm-Gg: AZuq6aKMGtSCwjb2cAmMmuCad7ZAt3XiNxrBK+YtyckbnQoAzKSpOR/LFgUkr5D8uBX
	1FZuhjwTvw3q3gNQDKzFCw0sLfPumHBI/85RCKl5E+GwINH+oEGPt4SXsZvCyd+jpCwUVJ+oCMW
	tRTu9fjHN5Sm54d5rOLUYFLarIc5wxD9VLhrcX+EIh9tY8rXcpHdwDmYnE9sYlh84O1Xpf0NjHx
	j8oJAbkhm08DYFgfq4tOHjnmx1fH3/YpsrlXCKHfzBlvZz4jvHB7W3TMKCIhvzZQSLImqahKaVa
	en5vjg0cqYmYcemlFqyRRmnrdUYQYhDnKyM4sZjYf7QdzW0z/QNTkQ++rXIHel7tlx8e4lgK0j2
	TILoF7PfxQFS9ZCy4Q/MNupZdBpDI4byLzUTm7mseY32QZlOpqr5sjfNT9PdJeqstsAJM6m3qRx
	xihA==
X-Received: by 2002:a05:7300:2211:b0:2ae:51fa:b7ec with SMTP id 5a478bee46e88-2b764508d53mr3559102eec.25.1769466488887;
        Mon, 26 Jan 2026 14:28:08 -0800 (PST)
X-Received: by 2002:a05:7300:2211:b0:2ae:51fa:b7ec with SMTP id 5a478bee46e88-2b764508d53mr3559090eec.25.1769466488381;
        Mon, 26 Jan 2026 14:28:08 -0800 (PST)
Received: from lola.lan ([187.183.40.109])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73a6b6227sm15057543eec.8.2026.01.26.14.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 14:28:07 -0800 (PST)
From: Daiane Angolini <daiane.angolini@foundries.io>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
        Daiane Angolini <daiane.angolini@foundries.io>
Subject: [docs][PATCH 2/5] bitbake-setup: Change the output to match the terminology in the docs
Date: Mon, 26 Jan 2026 19:27:40 -0300
Message-Id: <20260126222743.411405-2-daiane.angolini@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126222743.411405-1-daiane.angolini@foundries.io>
References: <20260126222743.411405-1-daiane.angolini@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=6977ea79 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=PIITv4rVe324bgT4salBLw==:17
 a=LVY25okwlNza5Yhv:21 a=vUbySO9Y5rIA:10 a=9UA2AVYIz8kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=dmwNTU5nqUlyjdgfk1sA:9
 a=bBxd6f-gb0O0v-kibOvt:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDE5MiBTYWx0ZWRfX7DVyS11FbuP8
 GuXhAkhTpmxwe+bEYH95CiB12d+9QYKse6cvmHoUpt+UjfSTfwFR+DcKN3E17t5j1TxNDZQOf/8
 rQkCz99BzpMLX/I5D7vx2aqJDnyXTFu8tWbqBwPNvozXo6ZhVDtE8nba+RLHz29TM0RVT0hofXd
 N5Awejar1/Zof7OW093q5a/7fWPReNfrvw3T8x+k32C0iaX322ISg465+k1o9I3NFDR6ulWJ7oi
 QSASWmE2DgCfnqt+nBctnwZDjMQMn2eGpkZi+RRmpHN9bjKm6MVsufEHEOv+cpiW2i7Zq1fC7CT
 089qzoyN8lvk9abrwT0LA0F9j/z5NPc54REd2rbKx173eMR98uE8JFU70RBS0EeADcIVL0PD+Hb
 w+oSmpqdFrdwVmj0KNJFLDmJ3u+EetDPU/8ytLov3wbawXz2Z/471vu9ZbyrsZP1T6A3ybGdoOM
 Aj22uJFyVeQQNWcZETA==
X-Proofpoint-ORIG-GUID: zKqrLxiVhsrOLi9HZt6lmH6I5Ew70WfK
X-Proofpoint-GUID: zKqrLxiVhsrOLi9HZt6lmH6I5Ew70WfK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1011 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260192
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 Jan 2026 22:28:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8654

The original output in the script does not use the original terminology
from the document. This patch changes the script output to match the
terminoly, this way user can search the documentation for help.

Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
---
 bin/bitbake-setup                                         | 8 ++++----
 default-registry/configurations/poky-master.conf.json     | 2 +-
 default-registry/configurations/poky-whinlatter.conf.json | 2 +-
 .../bitbake-user-manual-environment-setup.rst             | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/bin/bitbake-setup b/bin/bitbake-setup
index abe7614c8..65f0c5eb3 100755
--- a/bin/bitbake-setup
+++ b/bin/bitbake-setup
@@ -457,11 +457,11 @@ def choose_bitbake_config(configs, parameters, non_interactive):
     if non_interactive:
         raise Exception("Unable to choose from bitbake configurations in non-interactive mode: {}".format(configs_dict))
 
-    logger.plain("\nAvailable bitbake configurations:")
+    logger.plain("\nAvailable Variants:")
     for n, config_data in enumerated_configs:
         logger.plain("{}. {}\t{}".format(n, config_data["name"], config_data["description"]))
     config_n = int_input([i[0] for i in enumerated_configs],
-                         "\nPlease select one of the above bitbake configurations by its number: ") - 1
+                         "\nPlease select one of the above Variants by its number: ") - 1
     return flattened_configs[config_n]
 
 def choose_config(configs, non_interactive):
@@ -475,7 +475,7 @@ def choose_config(configs, non_interactive):
     if non_interactive:
         raise Exception("Unable to choose from configurations in non-interactive mode: {}".format(not_expired_configs))
 
-    logger.plain("\nAvailable configurations:")
+    logger.plain("\nAvailable BitBake Setup Template:")
     for n, config_name in config_list:
         config_data = configs[config_name]
         expiry_date = config_data.get("expires", None)
@@ -485,7 +485,7 @@ def choose_config(configs, non_interactive):
         else:
            logger.plain("{}. {}\t{}".format(n, config_name, config_desc))
     config_n = int_input([i[0] for i in config_list],
-                         "\nPlease select one of the above configurations by its number: ") - 1
+                         "\nPlease select one of the above BitBake Setup Templates by its number: ") - 1
     return config_list[config_n][1]
 
 def choose_fragments(possibilities, parameters, non_interactive, skip_selection):
diff --git a/default-registry/configurations/poky-master.conf.json b/default-registry/configurations/poky-master.conf.json
index 1de038bab..f248a4811 100644
--- a/default-registry/configurations/poky-master.conf.json
+++ b/default-registry/configurations/poky-master.conf.json
@@ -57,7 +57,7 @@
                     "options" : ["machine/qemux86-64", "machine/qemuarm64", "machine/qemuriscv64", "machine/genericarm64", "machine/genericx86-64"]
                 },
                 "distro": {
-                    "description": "Distribution configuration variants",
+                    "description": "Target Distributions",
                     "options" : ["distro/poky", "distro/poky-altcfg", "distro/poky-tiny"]
                 }
             },
diff --git a/default-registry/configurations/poky-whinlatter.conf.json b/default-registry/configurations/poky-whinlatter.conf.json
index bfa67426d..4827ebe11 100644
--- a/default-registry/configurations/poky-whinlatter.conf.json
+++ b/default-registry/configurations/poky-whinlatter.conf.json
@@ -58,7 +58,7 @@
                     "options" : ["machine/qemux86-64", "machine/qemuarm64", "machine/qemuriscv64", "machine/genericarm64", "machine/genericx86-64"]
                 },
                 "distro": {
-                    "description": "Distribution configuration variants",
+                    "description": "Target Distributions",
                     "options" : ["distro/poky", "distro/poky-altcfg", "distro/poky-tiny"]
                 }
             },
diff --git a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
index 824b01ffb..7bbe7cc75 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
@@ -347,7 +347,7 @@ In addition, the command can take the following arguments:
 
       $ ./bitbake/bin/bitbake-setup init https://git.openembedded.org/bitbake/plain/default-registry/configurations/oe-nodistro-master.conf.json
 
--  This example initializes a :term:`Setup` with: 
+-  This example initializes a :term:`Setup` with:
 
    -  A custom :ref:`ref-bbsetup-setting-top-dir-prefix` and :ref:`ref-bbsetup-setting-top-dir-name`
    -  A :term:`source override`, and additionally overriding openembedded-core with a locally managed directory.
@@ -762,7 +762,7 @@ They contain the following sections:
                         "options" : ["machine/qemux86-64", "machine/qemuarm64", "machine/qemuriscv64", "machine/genericarm64", "machine/genericx86-64"]
                     },
                     "distro": {
-                        "description": "Distribution configuration variants",
+                        "description": "Target Distributions",
                         "options" : ["distro/poky", "distro/poky-altcfg", "distro/poky-tiny"]
                     }
                 },
-- 
2.34.1


