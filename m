Return-Path: <jose.quaresma@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39025C624D4
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 13:32:39 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8104.1788269552137557945
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Sep 2026 06:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=pzGrZdbV;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Tb26v8JQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681DWF1q2566106
	for <docs@lists.yoctoproject.org>; Tue, 1 Sep 2026 13:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gn66Rzbte+w5fBicB9s33cL7HU8cg5Q4wco
	SZeFE3To=; b=pzGrZdbV6+7M+QdWVi7sMpITNTmDFCGpUZNj8Nra8JMXr5CPdLt
	MxMoON75/9dZKYbdSCq4alSWmz5fJWnvVquYBXIEdiwlHsy0SyV07vCoypqWDT2z
	oKzCD6qsOJ2zAAiuf3RpkEoF/0Fxh1bF/sJIC9OkBSedMMNFhy1ly5M1ogBvFpDf
	Errycc2+OHuHiuqnwNiJOEKIMLuq0fqiz1BHK0c9y2JJWdLz0PXSXeJHeo4CHQFt
	za0/4u2OL9ND19llHZfK2p7TCNF/Q4WU/xFXj1mRt5qTeqcT3dR+8M8ICjqaNBkm
	llBnIv7JWeEEW8k56Xj9Hiz53I+0x/rANsQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8ftfep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <docs@lists.yoctoproject.org>; Tue, 01 Sep 2026 13:32:30 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97c83bdfa6fso672026241.2
        for <docs@lists.yoctoproject.org>; Tue, 01 Sep 2026 06:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788269550; x=1788874350; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gn66Rzbte+w5fBicB9s33cL7HU8cg5Q4wcoSZeFE3To=;
        b=Tb26v8JQTNJnXfAXI/LXr13rjZKk1wdLYu3UZjLqMTh6UxC7yMepYtMKPPWzACmheX
         rvQZZLfCvQIs0zScv/I58DaVGg09IUKv62F+tcEBrsi5cITxV0ypXXP39EWpIqHIhmA0
         DmB25W0gjk3YQ7x4Z/XnxKLW59VXWIU2+zzJZPxrWA4TfkgotVlogRn+PJAR8/9749Yb
         +6REOlpzgi0VA8xA8xFfrlHG+2dX3CWcEFQrWxZKlqGBwcGzfK/EaVqVEm0ytiwx1cas
         D1NQ8Gc0HT/jbZfJwP03yEtPEjyP9SYIG1R4ZcfCXUDpiGVUGC6ITYe2I+mqvCGGw6EO
         +4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788269550; x=1788874350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gn66Rzbte+w5fBicB9s33cL7HU8cg5Q4wcoSZeFE3To=;
        b=LDShbRUVDVBfKC2JvnUkAzrRafSOFB31rRNhV9HskuyxMtqzWOyly2xomp/C/UGjNi
         7e5Wk8MtQboQa1tM1OquDpNn8Dj+lQlIGC8EWdVd1XZ00BmUP85ROxkRUA+z4G6KM7ba
         bQFf0hzWMqb/zeL2iGkTXRdsKT15cYBrqRRDi7mB4wpdeGAl1D5KTqWIjBFeYUcpf74q
         5iGnYSROJf0W2fhbLZdvW4GhWH9PWOVbohZIKtMA9L/J6u7T29rSzw7mRr/V7/cPLlKw
         PZr2jfZX2Y0GRiHoKvdYiYITRu0m9vWqnc8ZOhHD1c8yVZpw/IlH6THGr+1ZRJXmid4p
         bJWw==
X-Gm-Message-State: AFuF++kyc692FbRewZpePIr+uYfcjSwW8Io6S+9ym/HcTAsV9ZGRu1FW
	YaI+P/An1OG4JiM8+IcJwJXrjCAFFOmnGaaVnYuM4kZCbJpdzW3QF5B5xQDxQD+hbtCkrqk7+S6
	V90qzu05/n4ocAIOT/WTm/tnqgHcX0kGORi3kaGNAm+OthYTqs6UmZt/0iVMYUFPvaahC9MeJvw
	==
X-Gm-Gg: AR+sD12OkR2SyeSyxmktsFBhOJJ7kzpyG9Mo7hcnUmU05dcu1a/9gptbE++O1iHOVii
	2WZbL+RF9Fwlp8355hBkOL9DOf2M9gO2KZoHhEa4SrUH3p6tATDdoi4WJ7o5j82gfV92OdajLR6
	5H4WStOxXCqLoSUsF7D7rmucvAgMb6xlp+rGopdH+btIwW9DZPR4F8dvvt5GMAMhp+S3NG/moqu
	YATXhRwTijvHq/wth5fAVS9wpVjt+vff5DifDZuEm7hiPKzvNO9MBhLKV2F27aYzzRCXlQTXqKJ
	iar3TeGJ4TGVkQsrqs9SWHXkIC3eCsn+zmNVh3ZiX0dwKayJ+tb0qOdp54H8ygTVkbq9yDeMwqm
	iRGhlY3Hfq5t1/g==
X-Received: by 2002:a05:6102:41a3:b0:786:c223:ad84 with SMTP id ada2fe7eead31-786c223ae87mr9844357137.9.1788269549669;
        Tue, 01 Sep 2026 06:32:29 -0700 (PDT)
X-Received: by 2002:a05:6102:41a3:b0:786:c223:ad84 with SMTP id ada2fe7eead31-786c223ae87mr9844343137.9.1788269549190;
        Tue, 01 Sep 2026 06:32:29 -0700 (PDT)
Received: from toster.lan ([185.228.162.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce3e0desm71902355e9.11.2026.09.01.06.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:32:27 -0700 (PDT)
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
To: docs@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [PATCH v2] ref-manual/system-requirements.rst: drop ccache in distros
Date: Tue,  1 Sep 2026 14:31:28 +0100
Message-ID: <20260901133127.2608205-2-jose.quaresma@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sAV5NPokEdO_LyrtdEWJ3Qombp3gWWST
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyMCBTYWx0ZWRfX4iz2OWNRhUd/
 DQ87h+oX4007NJhcpou8Fr+LorUQ0TY+MwYfYhlR9JRZpevFjqK7m2Q0nYVKXPK0muelBlhXVQ2
 TJGi2A0XZHSeK460ngFOzRZdzGBKwfc=
X-Proofpoint-ORIG-GUID: sAV5NPokEdO_LyrtdEWJ3Qombp3gWWST
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyMCBTYWx0ZWRfX15i04NQSQ4lj
 9TV0obiPlQZMlxlXxdf2vhH3W/QcsJYS5jJSFIFJ88Get0aPq7TseyL0+yLCHm74pU5GfTdea0q
 Yts/40m5z3sHzSWiH7wLhrCGsFBW7vKsUROFhRoKJ13wSz+5FmJFGOjuKi7DAyxF5ucJqc4lgie
 p4VM0vsKeJXxRUc3sjrH4PNsQA2KOMAsTaRSR1Cr8PMbkjk8EDUNVpSuZYAx+6o/c3ZULNEq5HV
 9y7FwL5Sftno6fnHUHiLgyhAIAhLp+RtNYFiIMvFPs2mqKwfrvyNWyoO0+HeLJP/cG+4MwnfNr6
 3JV6g5ncVHe0Jb6WHoVltfRcTZWe1oOoPvSms4EYSE3GGx4AMy4XPdliyMrH3ahrP24rFM4WAfV
 UH8seGyF0fcxj7koN8J/gHaWlAnJGvrwmnW/uPLYZ9mMmySsYq0seG/DpXz86y5+JMr439YrX0l
 6snEKKxtfR1nbMoq4YA==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a96d3ee cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=YIx/k7VQn7/pPcQ+xNwIKQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=fdEfsZy_2SZaZvKhLB0A:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010120
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Sep 2026 13:32:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10431

Looking at the Yocto docs, ccache is missing on Debian/Ubuntu
and OpenSUSE but is in all the others.
The ccache is required to build "-native" packages in oe-core
because it requires HOSTTOOLS += "ccache".

However, this is not a required dependency but an additional feature.

Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---

v2: drop it instead of add

 .../tools/host_packages_scripts/almalinux_essential.sh          | 2 +-
 documentation/tools/host_packages_scripts/fedora_essential.sh   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/tools/host_packages_scripts/almalinux_essential.sh b/documentation/tools/host_packages_scripts/almalinux_essential.sh
index 14d18e758..c12b18e02 100644
--- a/documentation/tools/host_packages_scripts/almalinux_essential.sh
+++ b/documentation/tools/host_packages_scripts/almalinux_essential.sh
@@ -2,4 +2,4 @@ sudo dnf install -y epel-release
 sudo dnf install -y dnf-plugins-core
 sudo dnf config-manager --set-enabled crb || sudo dnf config-manager --set-enabled powertools
 sudo dnf makecache
-sudo dnf install -y bzip2 ccache chrpath cpio cpp diffstat diffutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip libacl make patch perl perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip wget which xz zstd
+sudo dnf install -y bzip2 chrpath cpio cpp diffstat diffutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip libacl make patch perl perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip wget which xz zstd
diff --git a/documentation/tools/host_packages_scripts/fedora_essential.sh b/documentation/tools/host_packages_scripts/fedora_essential.sh
index 55b8b704b..0a6a02314 100644
--- a/documentation/tools/host_packages_scripts/fedora_essential.sh
+++ b/documentation/tools/host_packages_scripts/fedora_essential.sh
@@ -1 +1 @@
-sudo dnf install bzip2 ccache chrpath cpio cpp diffstat diffutils file findutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip hostname libacl make patch perl perl-Data-Dumper perl-File-Compare perl-File-Copy perl-FindBin perl-Text-ParseWords perl-Thread-Queue perl-bignum perl-locale python python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip python3-websockets rpcgen socat tar texinfo unzip wget which xz zstd $([ $(rpm -E %fedora) -ge 42 ] && echo "util-linux-script")
+sudo dnf install bzip2 chrpath cpio cpp diffstat diffutils file findutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip hostname libacl make patch perl perl-Data-Dumper perl-File-Compare perl-File-Copy perl-FindBin perl-Text-ParseWords perl-Thread-Queue perl-bignum perl-locale python python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip python3-websockets rpcgen socat tar texinfo unzip wget which xz zstd $([ $(rpm -E %fedora) -ge 42 ] && echo "util-linux-script")
-- 
2.55.0


