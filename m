Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F336ED2FEF5
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 21:53:30 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1236.1769550804102701128
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 13:53:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@foundries.io header.s=google header.b=TIhADXkV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.168.131, mailfrom: daiane.angolini@foundries.io)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RJ0gDV2436401
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 21:53:23 GMT
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by355rfrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 21:53:23 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-124a95d580cso1306760c88.1
        for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 13:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1769550803; x=1770155603; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhBeqlh+7XFSVtKGkqCNSyVPQct07oOIo+OIdBvLxjs=;
        b=TIhADXkVggyew3wg10vuU57Y/1UPHk3dZdVFUKH6zz8LXexn8LrZhyfZR3FOV/kkUG
         emGc145ZupNGO2uAH1IKYxOMjxgObyA1c6E7oEcGJ8DyHiS1rB+SNgdDVCVvbW+SKdUd
         w4gzNWXG1XBXs++4ZvCK4c1USZU54kQe7r9bRK74TeIY+ppI72NqKe1f4YA/ly66f9Eq
         SIScQaCV2/mZextwFoL6LI/sfDGEbShsfXvyk5k9JobijGKautWj6pcpzxQILqDjgBht
         xCb3m+UG8RpoK1tH7g3ePckzvOared4NR+U1AtM9p5x0gguVn1A0LxRCSBsB+Tv1JcXw
         N3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769550803; x=1770155603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JhBeqlh+7XFSVtKGkqCNSyVPQct07oOIo+OIdBvLxjs=;
        b=D5eMwnB9ZjULBZxQtlDTjzgG2YKSH9rY2MI0fMXV2J14dquHGQZgquGHuUPuMUHnY3
         nMAcvXECXSsVHE5isn/o8nvshTEXTLAT8ALRHzjf+ErC9lrrAXjPVCOyuKoqg/YE2aiB
         XS4ikrrMT4IC4E86gzi0VYbCX3NPVw87RObQgiKSeTGhz8GYw9bOsAmMrSHkmvUrDum8
         KDjJqc4JpVtHD899IfoZBdO5oYMepp2+JU2aey6PlIqbEWqWN4oxk2ZiWwLOp51de1d7
         reSVn8mV78RelNuWlGVP/WNyBkO53g2dNDYRbTiQL+BXLHJSjs2NxDvSCKumBHZ79CN9
         GK3Q==
X-Gm-Message-State: AOJu0YzKNU5JD8Ff+bcrmL6CBZj0kxOO7p3FO7KfBpqPFBYLJ7RDttkU
	rvhK2VvfkbkGaJJsS9SC3otA9pPLc4NwLNEME4+GH+U/nT8fme1NT/YtHM4b6uk8zaVM56ZvMt3
	tF7eYKgFkGEYBrgHbmp/9K+7UQFEbozpQ3QOjJfp/4DzXuFl+/ps6Kf6L4JgdVNba
X-Gm-Gg: AZuq6aKR0I8PU2wYS0zvAn5qCnpCV7bH5/KZce9lWQ1+RyO5Ff6KhLmCZvF42QtryFX
	BOirumnrVbq4pq+wyM7dGOvqGQ3kZRcd6iLe1TmXwbhGUBvZsMqG2PjE4EDfizHXR7hlOEFBHso
	0oNxOn+ltB3XYCA7xumzrAIFV27TMS8/1oIZAZhNkL6za3F6H6Q9a37h229sckDWMPNSl7FmGfZ
	3RQbntBD84HRcK0Lcc8srYQTRqO/+dd1i8rceWKE+/WIoypbcDjtSkvZubGEPu1E2PisUibqa2+
	BAbq7tO8C1cxR0hiHwgr95t6mfVYFzjlesHOJcvN5OLSfmm+8CsL8UffyrpiMVEL/A1M7e0Xd/q
	8oL1EG/VCKdVUroOYvA1xlMtjppIhLHkxrqPYzVu9ETVqPPKaOZ7gNVEnO0ziVdIOlrrq8bApy1
	mGnA==
X-Received: by 2002:a05:7022:488:b0:123:2d38:929a with SMTP id a92af1059eb24-124a00cf0b9mr2095068c88.38.1769550803046;
        Tue, 27 Jan 2026 13:53:23 -0800 (PST)
X-Received: by 2002:a05:7022:488:b0:123:2d38:929a with SMTP id a92af1059eb24-124a00cf0b9mr2095051c88.38.1769550802549;
        Tue, 27 Jan 2026 13:53:22 -0800 (PST)
Received: from lola.lan ([187.183.40.109])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9cdcbcfsm31627c88.0.2026.01.27.13.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 13:53:22 -0800 (PST)
From: Daiane Angolini <daiane.angolini@foundries.io>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
        Daiane Angolini <daiane.angolini@foundries.io>
Subject: [docs][PATCH v2 3/4] docs: Fix leading text for bitbake-setup init
Date: Tue, 27 Jan 2026 18:53:02 -0300
Message-Id: <20260127215303.512936-4-daiane.angolini@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260127215303.512936-1-daiane.angolini@foundries.io>
References: <20260127215303.512936-1-daiane.angolini@foundries.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Authority-Analysis: v=2.4 cv=YNWSCBGx c=1 sm=1 tr=0 ts=697933d3 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=PIITv4rVe324bgT4salBLw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=9UA2AVYIz8kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EGU_KJDdnLjsBuGhkGQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: wJqHJshgZIN8Zq-2JZ3e92ZNx7_8I0pS
X-Proofpoint-GUID: wJqHJshgZIN8Zq-2JZ3e92ZNx7_8I0pS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE3OCBTYWx0ZWRfX6KR6FkDmsz3K
 K6pYTcOxMeNgsWTR+BuFP5+YmY0aXb4SRsG9x8UP9PGk5D66c8DdoqmsahCOivSiC/eDUz67i4w
 R0hcO4GUTuz261Pxua/HtV5NWufBFtZ8KIdCdNjaehM53EyJJSWop6BfEd6Am5SHr0Kdbcukont
 mDae7txKQhNZuqtYRxk2jZpZSqhU5JbkejmMfF59iK9rWTqFPOJefLyIFfp6YkC6IU2RUOXdv5w
 UYhwqO1v5t20tNIaspaasvkCcgs70I2VsYkSfjBVJSv8ZX0iQZuSel8fWlYZXcYvrsIqOWsnXk1
 FXA4tl7rKwb1mZqv8lihSbkSBqelKY9Dfaao2Xgvl5yeeF9Fv01S0n1G4dXTTslIGAOCo775I88
 BVo7FmDAQAzYV0lep4njJz4rZIktJ9hlfCWOgKBJdhS0rMQUhAMmVrb76oOmadq0LZtcA3gcjlI
 wxiuACowCf5vGUrGobw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270178
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 60RJ0gDV2436401
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 21:53:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8753

If we use the default of bitbake-setut init we may not create anything
(as the first default for an empty directory is N).

If user does not chose a number, the script asks again for a number.

Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
---
 .../bitbake-user-manual-environment-setup.rst                  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-environment-setu=
p.rst b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
index 6d76e3db4..8d86659bf 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
@@ -50,8 +50,7 @@ Quick Start
       See the :ref:`ref-bbsetup-section-config-reference` section to lea=
rn more
       about ``bitbake-setup`` input configuration files.
=20
-#. With the default choices, the ``bitbake-setup init`` command creates =
the
-   following files and directories::
+#. Here is an example of files and directories structure created by ``bi=
tbake-setup init``::
=20
       ./bitbake-builds/
       =E2=94=9C=E2=94=80=E2=94=80 site.conf
--=20
2.34.1


