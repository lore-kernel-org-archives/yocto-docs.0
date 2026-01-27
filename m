Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A0FD2FEF3
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 21:53:30 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1235.1769550802029612961
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 13:53:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=dXRqsBqV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.168.131, mailfrom: daiane.angolini@foundries.io)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RJ0ms32436568
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 21:53:21 GMT
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by355rfrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 21:53:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b6f0b345e3so34358356eec.0
        for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 13:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1769550801; x=1770155601; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IA9D+gOmvMUJO3RRBaFRFNuQ47rZu/dEOy44dlbTsM4=;
        b=dXRqsBqVHsm/VEq0738LabqPMvjFKaBiZpkW1JSRI/WF6L8YZ9rGpVKUjk4yxeOAtk
         k0tV+JgNXYHMgBONHLLvS0Ujddop9eP0Ece/pGi4S3fmWnWEp6YTFMGi27JWD4EzZzDY
         bemSlXfxEbgN8YS3w+dTzcZjGsuPtnYkWEdTqSKEWgeh6sUigCx606J4ZQcSrUSaHdWK
         fmgAP1Kk7NpJdddm1pC3xywjSOxPpPUtsyaKUp8ZjSAmhf6D2RdwlTDUNdFuKU8QGxsW
         IKNEnttQeBIjTQsTa4uunT8y7BR4WF2bnNAh58XpODR/s8qXouEDRIUbYqQLzwiwBykx
         Q0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769550801; x=1770155601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IA9D+gOmvMUJO3RRBaFRFNuQ47rZu/dEOy44dlbTsM4=;
        b=SMF1vxZN9FRyIJsLmBgk3xlzwsJFAQCyHbvoMk0H/dcum981NhhEyUGOhjXOYURUnO
         mdrmn8jVoDrdIExBA07t4SUuZJpR5ZR5Kai0Z5HORJWEfVqk/LyrXSQoZF12G+YHkZBL
         q00Z4rzaTNo0ZgdTL0qHFtOoZ3FtcymGkd72x4W4NgxL32H5hf001WFYdGpS0xjUHJY8
         FsTcd3+T7mRWCArvJTrQRICEGlFgIn3FlGjAqsTH0wyci5McDKxT6wvrzSCJvIe4Tt4R
         zJ/PadeyzYI1TZLCKBdpau0grCXALwHo3USFHPqELCgIwX8abzdZLgcNyXvtnGxGmghe
         bH3A==
X-Gm-Message-State: AOJu0Yy/HXOXZ7zDeZ6JRsiC6fPmre70sZSSV1zrw74CpXefhQXIUmm0
	FaZ2inWwkpMYYk4rCxJztxfuBSmq15GwSK+7yKM6DScs50yiqNb3WzhnHibALZeylzAFe66C6Fg
	9OmUAKaAzm8fFgFcKxY0N0sMxiJ6A0aG68bacT4OtjB1clu7xO/s0jdSB37zH+erF8xFf2DLy
X-Gm-Gg: AZuq6aJ0uAXPpVcX9UmyHn9beJmcLozZIxuyC89OhCXqpLDcqKGVL3DxSFnFTj0ZXJ0
	9Yimpd93c+ElsVeAjDiZPu8F9lyb8MnlJf5rOAy/yUYiPsgUbjHDHRonur1BE5g32PVAoTVG83p
	ZJYwNmNfxftQNMdUdiqSMrsDPWU67Z/1OHD2DGq0PbM3jhRj1VrtamRmuuEuCYsllaF1IwU4VWA
	sJ/7stzZuoUL+l7dzej2m+0w8ZQ+720yws55JRPtiSOuIa7LZx+M3Otc0vX8GV7LXIGW5jFOzpr
	qgIA5w3YytM87b7Uyep10JiNbLp7a7Bnlm9dvbxEFnWp0BnNUIi+0whuvSLZuJ7/DVC8euwIybQ
	jpsTIP0XQuqTM0Npl9G5Jqhd82Qro7pwTTKOg9W0fcp4bCFFab/CH8jO2nVZlkdkhJ3E9wwok7x
	YnAA==
X-Received: by 2002:a05:7022:fa2:b0:11f:2c69:32 with SMTP id a92af1059eb24-124a005baa1mr1750930c88.7.1769550800701;
        Tue, 27 Jan 2026 13:53:20 -0800 (PST)
X-Received: by 2002:a05:7022:fa2:b0:11f:2c69:32 with SMTP id a92af1059eb24-124a005baa1mr1750916c88.7.1769550800209;
        Tue, 27 Jan 2026 13:53:20 -0800 (PST)
Received: from lola.lan ([187.183.40.109])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9cdcbcfsm31627c88.0.2026.01.27.13.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 13:53:19 -0800 (PST)
From: Daiane Angolini <daiane.angolini@foundries.io>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
        Daiane Angolini <daiane.angolini@foundries.io>
Subject: [docs][PATCH v2 2/4] bitbake-setup: Change the output to match the terminology in the docs
Date: Tue, 27 Jan 2026 18:53:01 -0300
Message-Id: <20260127215303.512936-3-daiane.angolini@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260127215303.512936-1-daiane.angolini@foundries.io>
References: <20260127215303.512936-1-daiane.angolini@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YNWSCBGx c=1 sm=1 tr=0 ts=697933d1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=PIITv4rVe324bgT4salBLw==:17
 a=LVY25okwlNza5Yhv:21 a=vUbySO9Y5rIA:10 a=9UA2AVYIz8kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=1WldhAeflNbf4ZlfaWQA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: k1_N4ll9VY-CWe28_BWzWFNIFcTnL6aR
X-Proofpoint-GUID: k1_N4ll9VY-CWe28_BWzWFNIFcTnL6aR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE3OCBTYWx0ZWRfX7jyzd4zAWSjo
 R3pWrM0M+sMoswqd4CS8oyo+DcREoXHFWNaeeDFF+z7/yBvfUIZI1IjDGVKEfu79vQfhSRgEXMY
 Gyal3oNxHeq2yWAftPduBuiLIXpi45Grfh27jxfQqEGTUybEE4g2aZuMPg1HTRjAu7VUbKzsC+i
 B2TITA32QfUgWtMR5TTBkZKbfP45g3vEMXGFmrsOwZRX7mIAvrfNoqQ+NGEhmZslOD/F0MXCAAt
 B4Yne33ssXe7VDC6Q6AXW7ozxFx8EfVtnRvWWBA94Y0pk6qZ9svD45ULT7DGtAh4lKAHJPRzjAE
 JzUfaVY9JzYc8hO7ZTh2HWdtYcd26X3qHOtet1ZvTsYiMjPLyeQvC0hTTqHdsbTqQ8UxCS93Did
 oJ34TJ2C5O7EBFkTomGKI6kDLfm/vvSf6vHHHHiztsh4i97PKbGYNrX+lme2uGM0S0i6dQhr9QB
 FNjnig7VLxxagu/Shbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270178
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 21:53:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8752

Make the output to match the terminology used in the documentation for
some terms.

Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
---
 bin/bitbake-setup                                             | 4 ++--
 default-registry/configurations/poky-master.conf.json         | 2 +-
 default-registry/configurations/poky-whinlatter.conf.json     | 2 +-
 .../bitbake-user-manual-environment-setup.rst                 | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/bin/bitbake-setup b/bin/bitbake-setup
index abe7614c8..d3654cac8 100755
--- a/bin/bitbake-setup
+++ b/bin/bitbake-setup
@@ -475,7 +475,7 @@ def choose_config(configs, non_interactive):
     if non_interactive:
         raise Exception("Unable to choose from configurations in non-interactive mode: {}".format(not_expired_configs))
 
-    logger.plain("\nAvailable configurations:")
+    logger.plain("\nAvailable Configuration Templates:")
     for n, config_name in config_list:
         config_data = configs[config_name]
         expiry_date = config_data.get("expires", None)
@@ -485,7 +485,7 @@ def choose_config(configs, non_interactive):
         else:
            logger.plain("{}. {}\t{}".format(n, config_name, config_desc))
     config_n = int_input([i[0] for i in config_list],
-                         "\nPlease select one of the above configurations by its number: ") - 1
+                         "\nPlease select one of the above Configuration Templates by its number: ") - 1
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
index 76f5c41e3..6d76e3db4 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
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


