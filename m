Return-Path: <jose.quaresma@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F6DC61DE2
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 09:59:08 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26119.1788170342104230871
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 02:59:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=A6txke1L;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=YmtOQSRQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7x9EI3664472
	for <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 09:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jgYQgxTZe3GgqaYNrGDOEEgJtErGR1BUPQQ
	cYx8phnM=; b=A6txke1LssayO4KiZCfIs/juLDM/aBwxgCAwrm52Ao3evonJhHK
	o6+TCdBq50QYqkoZLy4q54aEa4AY78mctVffT0BG24/Px0M7o6ci+YUgBVei3JAY
	zrmmEQc5Q/++ZNfTeMZUmctN0bJlwLTz87YWaeqBtSNtHpz2d4ngomO7trUIT4JV
	XYxdcE3jS9aoayhETaj5ByqFG54ZZqQgrc02TmUVTc3yuQrauiquUwDLYNDxIxNx
	7dPvvwzJ/4EpJR0xyJwlhWE/853Sa5K9/7HqhBFVkYhVK+qagc6A9eqaai991Bry
	rCxa96zIW31uKtgW+gdbJazTWPAIMON9iow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4x08r2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 09:59:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930b571432fso468978185a.0
        for <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 02:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788170340; x=1788775140; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jgYQgxTZe3GgqaYNrGDOEEgJtErGR1BUPQQcYx8phnM=;
        b=YmtOQSRQYqFAUcmJlo5Rwu2fdt03yIo0myAp78Y0wvLyCFM6yf5Ju5FL3ZzonVMu42
         vllHh8V3jYsy5K70V8QRUhGHziOnCJ4ESJFRthMcU/bnqMGaYSbd8HBkgHrXoaTwWKQ1
         T1Q7189MqBvbOiI2BTQj7b+Hz71mIc81mn/htmbCDytmKz9mKSFKayrbyGYpt1vQhbqK
         Rh0UA6YaPyRNDZbCQo635VHsOJrF6wGQ3ln+vxn9/Th4YXmXhkOr0bA+YyEy0VXHKpM1
         ag+mX7Ia6zbCR91gtumjyoG/zmB2xEcm7N0n0/BxIuP6HiVHILOotEb1s2PILYEQr3JZ
         YXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170340; x=1788775140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgYQgxTZe3GgqaYNrGDOEEgJtErGR1BUPQQcYx8phnM=;
        b=KXhzmGDDkTvA6sh7b5Q5l5GnHXlhOnsgDwhytmkCOyi+K1fdzmBDfs/cIpjzLgxmiP
         V234KfN7/ZLm1q8ZDlqc3rBxz8jddMA1TMptg4a/2cYMlfCw79/8Ut3ouqD0m/Fws/pO
         Mkz38t9w9orcuYWm4gZdCxiUfji09VXXzVfpA5CJClhzeUQDKl/KALw1yex1hbe3R+w7
         8K8rlrhIDyCI3xpF2Dg5t89uEX2HTBaRLixeqV2rA5AZSfu/e+XRJ4wXfp+Jd/U3S6m6
         cZiLWokiVMAIgdgIPqouomQNJeOIoXG0zatQ1Gw430wY5ixHGGUUC98VLnR2oihmsQoO
         fNpQ==
X-Gm-Message-State: AFuF++ngMt1TjIu+zPfHcKFARMWKikQwWd4j9F+KIb84CoGivHqNiFG9
	utUlDwJyQ8sbsE7mAlHXPlzffQiysWWMr+Lxkx+DPsOYNuZYKcO8oduTV9ugmbKIoJ2bFHOSrtB
	vVBtNL+Y7c3bzG3SI29axHNan5av16IPWimclqKa+V85OQMXEro3QibmNkwWQGOOkMU9Ro/I3sQ
	==
X-Gm-Gg: AR+sD10Q9A4pg16qSwwINKLm7RR3XeMR+t+NJO99FP1npUBKQ0XCf7aRbU6qqKajYAO
	SeKikA33ErAq74LcMznm/7JmEmkzUk7QCrQDr8Mj1XTZinVPLcgHh5o+/EHmWSiN1h69wH5XUTs
	5qa72x/zw80pQeSKi9UgqZTdB+3x/Cd474mfBQidCf3uHJhBfONO2PsXxDKQSXIsCkXAWRUFfRv
	G7XBvpMEpEKKU6mC9ze0PARe1YIzseKZr7o8iaHlx5MdALxHA8iqhxT4heoDRAXLxlpe8FSZ78m
	zDTmr/d8EkOQmAG4DB6eXgMFMGMqiEWuyZCiEgAJBHKnguIMVxUq6++Lklrs7wSsaPLPzTM3B1+
	dE5nvRfXOS6xFCg==
X-Received: by 2002:a05:620a:2b4b:b0:939:bb:96cf with SMTP id af79cd13be357-93936c04546mr759706285a.9.1788170340238;
        Mon, 31 Aug 2026 02:59:00 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4b:b0:939:bb:96cf with SMTP id af79cd13be357-93936c04546mr759704185a.9.1788170339792;
        Mon, 31 Aug 2026 02:58:59 -0700 (PDT)
Received: from toster.lan ([185.228.162.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb2072csm18578443f8f.23.2026.08.31.02.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:58:59 -0700 (PDT)
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
To: docs@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [PATCH] ref-manual/system-requirements.rst: add ccache in distros
Date: Mon, 31 Aug 2026 10:58:56 +0100
Message-ID: <20260831095856.2298-1-jose.quaresma@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4NSBTYWx0ZWRfX6B1Mn8DjjT4w
 VSzI802yAoXe5YQoE+YTYQCDya+OskMnszqWWcySINtfU7H5J9ZTTkkDqwFpVSv4+He95PcXJqB
 WM8B/vJ18USKU3HMpeErjbiWNICwmeM=
X-Proofpoint-ORIG-GUID: uen11tkpaq1XaLFQY2LJAwnFxLW6f8ur
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4NSBTYWx0ZWRfX1PzV/Mz0sreU
 as0d50YYWN9JZ7eU3mAWaplue6sHoLj9Z4KAkHl0OrSateWVUBAfVD92fmSOoguOKUdghkq/NnW
 57/BWtdzPjIU5zbRSwVnIPL4Bakx51L6NsCNDq9MIjMb7/Z9j+5ReRiutrUgM7e3/679+AjpCUi
 Fd0IqtRfeLNkwayjZrZ6DiBHq/xf600S4OEf5roRgH1nndUZfoZbVXpUDxM/f37YN5nc7vDuJBd
 WBbj3+edYzamwffFTATCWNKbfw4oQP9P1P7gAOS0p2lLpFDW/L7ucXOWUkVQEpOeXbch9HSSOt/
 YaCMDj8O8ky/nAK5QLbXjJg7BcAzSAKtZRL4VMF5OjrXnqhag4IPI15gPJ7BHPKiE8cPlMioEHs
 7MN2PygOMuhR3rJoRmNyIUqVzsRTvDeUNVWdUYaNPpq+w7YpD7hlN41TiLQkmBJgcWDfdSnVXkZ
 iOR/qMUj7cMg2w6zgDw==
X-Authority-Analysis: v=2.4 cv=Iqsutr/g c=1 sm=1 tr=0 ts=6a955065 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=YIx/k7VQn7/pPcQ+xNwIKQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=feW8_qiaE11zNoPI7RoA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: uen11tkpaq1XaLFQY2LJAwnFxLW6f8ur
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310085
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 09:59:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10418

Looking at the Yocto docs, ccache is missing on Debian/Ubuntu
and OpenSUSE but is in all the others.

The ccache can improve significantly the builds speeds when we can't
take advantage of the bitbake sstate cache, in such scenario we need
o compile the code. The cache storage needs to be available from the
previous builds so we need to store these ccache artifacts temporary
on our permanent storage.

The ccache is required to build "-native" packages in oe-core
because it requires HOSTTOOLS += "ccache".

Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---
 .../tools/host_packages_scripts/opensuse_essential_15.6.sh      | 2 +-
 .../tools/host_packages_scripts/opensuse_essential_16.0.sh      | 2 +-
 documentation/tools/host_packages_scripts/ubuntu_essential.sh   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/tools/host_packages_scripts/opensuse_essential_15.6.sh b/documentation/tools/host_packages_scripts/opensuse_essential_15.6.sh
index 0d37e9bd5..9f839d190 100644
--- a/documentation/tools/host_packages_scripts/opensuse_essential_15.6.sh
+++ b/documentation/tools/host_packages_scripts/opensuse_essential_15.6.sh
@@ -1,2 +1,2 @@
-sudo zypper install bzip2 chrpath diffstat gcc gcc-c++ git gzip hostname libacl1 make makeinfo patch python python-curses python-xml python3 python3-Jinja2 python3-curses python3-pexpect python3-pip rpcgen socat tar wget which xz zstd
+sudo zypper install bzip2 ccache chrpath diffstat gcc gcc-c++ git gzip hostname libacl1 make makeinfo patch python python-curses python-xml python3 python3-Jinja2 python3-curses python3-pexpect python3-pip rpcgen socat tar wget which xz zstd
 sudo pip3 install GitPython
diff --git a/documentation/tools/host_packages_scripts/opensuse_essential_16.0.sh b/documentation/tools/host_packages_scripts/opensuse_essential_16.0.sh
index f3ee6ad54..3eae28dd4 100644
--- a/documentation/tools/host_packages_scripts/opensuse_essential_16.0.sh
+++ b/documentation/tools/host_packages_scripts/opensuse_essential_16.0.sh
@@ -1 +1 @@
-sudo zypper install bzip2 chrpath diffstat gcc gcc-c++ git gzip hostname libacl1 make makeinfo patch python3 python3-GitPython python3-Jinja2 python3-curses python3-pexpect python3-pip python3-websockets python3-xml rpcgen socat tar wget which xz zstd
+sudo zypper install bzip2 ccache chrpath diffstat gcc gcc-c++ git gzip hostname libacl1 make makeinfo patch python3 python3-GitPython python3-Jinja2 python3-curses python3-pexpect python3-pip python3-websockets python3-xml rpcgen socat tar wget which xz zstd
diff --git a/documentation/tools/host_packages_scripts/ubuntu_essential.sh b/documentation/tools/host_packages_scripts/ubuntu_essential.sh
index 43f071a09..849d669c9 100644
--- a/documentation/tools/host_packages_scripts/ubuntu_essential.sh
+++ b/documentation/tools/host_packages_scripts/ubuntu_essential.sh
@@ -1 +1 @@
-sudo apt-get install build-essential chrpath cpio debianutils diffstat file gawk gcc git iputils-ping libacl1 libcrypt-dev locales python3 python3-git python3-jinja2 python3-pexpect python3-pip python3-subunit socat texinfo unzip wget xz-utils zstd
+sudo apt-get install build-essential ccache chrpath cpio debianutils diffstat file gawk gcc git iputils-ping libacl1 libcrypt-dev locales python3 python3-git python3-jinja2 python3-pexpect python3-pip python3-subunit socat texinfo unzip wget xz-utils zstd
-- 
2.55.0


