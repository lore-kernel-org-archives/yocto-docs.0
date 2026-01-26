Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B5D1D1952C
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 22:28:20 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33758.1769466493386553784
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Jan 2026 14:28:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=VLXGDfnX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.180.131, mailfrom: daiane.angolini@foundries.io)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgJVY286726
	for <docs@lists.yoctoproject.org>; Mon, 26 Jan 2026 22:28:12 GMT
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdva0jtp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <docs@lists.yoctoproject.org>; Mon, 26 Jan 2026 22:28:12 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b7155ca88cso4558963eec.1
        for <docs@lists.yoctoproject.org>; Mon, 26 Jan 2026 14:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1769466491; x=1770071291; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fT7lu0B0msCLuinqYTxbPwSZ9ApOFX0xq48z7TGck0=;
        b=VLXGDfnXv0A+mqZr9Zv8gPjbZoIrs7mw45+o4qDVf3plgv2WN5NP4WdFXDIY7LZ/B4
         vJupf0pKFTlwpoWyrnTzrPpOBCdlBtBSEj0r5F6GhjMblhG9xz6CatR3oLI0mQLiBxub
         uIQamNTS3uHvSfbgvNV3tRXU9BrlTLMcSrFF65WoNkBmiBj/XYzB20fSLVMI/zFbiUoR
         0jcAL2tc/znF9KnVRfC776D2hhovBWp7xuRUc+R7VzYP5PZGO/TqjRdxHT/0b6hCc3nh
         5pjgcsTdU2hFNhaDrMMTCWcmECK3E7TdsX5YL3F7QBtd9XlfO2rD6dlaB2d5LKAj27x3
         Qmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769466491; x=1770071291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5fT7lu0B0msCLuinqYTxbPwSZ9ApOFX0xq48z7TGck0=;
        b=wcVDQQ4nQ62pQd2l9BfXZeY+3AI/wO0XbzAcXHHY2bGu+LMPZPQG4HUp54TB5VPnPb
         IQQJl5AKoHWLFPKhAnh4d8S/f7HMbufnBTjgqxx/RDC6yKQQCk3q71/Q00FOSMYY7H4k
         xDKPtvVAHpkD4f0+JsiCeOH9YYnN9J7A3k1/gXztHB4/3+vVZqIAlNsGvipedHaRL09s
         e5OefrSgRl2ECWY98OlZ6KG+cYk2oOZfaZBxbpdRIfXOewTDlF1PfqO2ZG2+D2RzdIGH
         lr5MdYzI4vFKR7qx781dP3eNB99F3wutQDIJQ/EY+qHDIMcLFA7HXbkh6f6oKsew63n3
         nF9A==
X-Gm-Message-State: AOJu0Yzoglnh3x+Gtb3tnPSxzqEKLlF59LAhES5QO9GekOcMQKiroHRq
	RPQCu23lL3+YBxKHyRx844+FqSKbjbqmE8lAI3AaaiZHxxYfK1s0DWWsXf53gen0LtAhciPdXrQ
	t0BPAmaLN9HRArNdknjvCKzu4vK/EBfFPoEtM9pHclFeiw0+mj+kTuHpvHPo82HwLALZETRTy
X-Gm-Gg: AZuq6aKC3AJfXhYOPFm4GHmn0ZykMBzyp0mTiIc+jrP/CKojaK52ksK4NIuLbNMDKFC
	SNZ4psGztnL6dbT5xMA9yQWPGVqlnXPS1VnM4BTiN9uTFn/GNtt9yzH0p6V061gyabwe8Q297Fq
	kaqfYY1PK33rCm0KxrpELkf7c268L7utz/GV/LHHO8vayiV+NjpDmDYx3Ng7JnjVdhG66Twb3Nl
	udMaH4JDTsuHfhBsGSEZYfSrEn3E67wwUkY7oR4O97X/2DnrqXQg+vI71SPtHawLJPj7TzVM8xf
	i0KdD1cZzUNSx9z/9L51qZ55VHfALPMB+NQNSxKkcyjjmyiZRbdQu1p79Ag6f4VrXW/liRsSMN/
	c8/ag2pzZHuVy6OzFR9kT6EJIKNYltfioyqZgJaEEK4CMAXM3p+6NVPtftzOK66+Ud3Cnp+cEOB
	mGTA==
X-Received: by 2002:a05:7300:1483:b0:2b7:1e86:35ee with SMTP id 5a478bee46e88-2b7644f24d7mr2750577eec.28.1769466490927;
        Mon, 26 Jan 2026 14:28:10 -0800 (PST)
X-Received: by 2002:a05:7300:1483:b0:2b7:1e86:35ee with SMTP id 5a478bee46e88-2b7644f24d7mr2750570eec.28.1769466490525;
        Mon, 26 Jan 2026 14:28:10 -0800 (PST)
Received: from lola.lan ([187.183.40.109])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73a6b6227sm15057543eec.8.2026.01.26.14.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 14:28:10 -0800 (PST)
From: Daiane Angolini <daiane.angolini@foundries.io>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
        Daiane Angolini <daiane.angolini@foundries.io>
Subject: [docs][PATCH 3/5] docs: Fix leading text for bitbake-setup init
Date: Mon, 26 Jan 2026 19:27:41 -0300
Message-Id: <20260126222743.411405-3-daiane.angolini@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126222743.411405-1-daiane.angolini@foundries.io>
References: <20260126222743.411405-1-daiane.angolini@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fH1kCZTlzt88r_4utEJdFdiJvoa_Dfbq
X-Proofpoint-GUID: fH1kCZTlzt88r_4utEJdFdiJvoa_Dfbq
X-Authority-Analysis: v=2.4 cv=I+5ohdgg c=1 sm=1 tr=0 ts=6977ea7c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=PIITv4rVe324bgT4salBLw==:17
 a=vUbySO9Y5rIA:10 a=9UA2AVYIz8kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=5bBFTqW_sXXhRPb7D7UA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDE5MiBTYWx0ZWRfXxD5FXiJUHN4e
 iXppAcFJX3ZjhvbfEH8VuXyYSBOyY71LMnIZHkd0Zww3arfaglfIUkASek0Z9LvGVPzkDzeXodl
 SqTcSHO3/cAaN4p13AR56NHi5jm5QdqRuFFa8IMPexEeUz83w+ogkpwLsHKGrJu0LZgh7r+ItV/
 0Y/TKaxcMeo4DiRK3zuHuk3Gz4gm9TI+c5tR+3cWV9WIHaCd7j9E8fxK5CSOXYhF90i3gVhiRjU
 kfhdKT5EsbHYCYCfB2C7HyOGAGGFDhUIz0CobLBARZb82gKjqacZmYqH7oh4mTA7Oa08X+xHAmy
 JsN+jlHGJ0aBzmMdOuENj2bdfHieZ0V4pOOPGV2afWvYXxsHgBELJI7xWk75ynRjegos6tGKBv3
 i5BcH383pCoFyE2CUomaCi/jHSs/M5zFW2X9LvbX539AihnsryTAwlnwKhGvcZfYk1JSsQS/Lps
 55vP2KNG8Fqb1GUgjDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1011 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260192
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 Jan 2026 22:28:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8655

If we use the default of bitbake-setut init we may not create anything
(as the first default for an empty directory is N).

If user does not chose a number, the script asks again for a number.

Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
---
 .../bitbake-user-manual-environment-setup.rst                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
index 7bbe7cc75..e316ead56 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
@@ -50,7 +50,7 @@ Quick Start
       See the :ref:`ref-bbsetup-section-config-reference` section to learn more
       about ``bitbake-setup`` input configuration files.
 
-#. With the default choices, the ``bitbake-setup init`` command creates the
+#. One example of ``bitbake-setup init`` possible command creates the
    following files and directories::
 
       ./bitbake-builds/
-- 
2.34.1


