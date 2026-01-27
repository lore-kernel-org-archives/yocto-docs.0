Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16BD4D2FEF9
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 21:53:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1239.1769550807705974638
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 13:53:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=kGK327RV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.180.131, mailfrom: daiane.angolini@foundries.io)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RFwwug1714603
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 21:53:26 GMT
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by0g095ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 21:53:26 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1233b81a92dso334407c88.0
        for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 13:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1769550805; x=1770155605; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wz0uqWgQ1hdqBdE8i4ul6Oa/CAVX7Z5/wVEh6XPOWlc=;
        b=kGK327RV6PnbGPlhAbQT5GJCfrudn4ZtLDVdS7MVw7LNk168sW0Z32sKoZTKPRhKtb
         Fjl8enKcrVmZFK6BIMCXXs9Gqw/Id/qIP7PHRYen8O/emDbazKpEPWN/gdVTOAGEAUdo
         MgxXtEgycvx1NcFWcY1Atuz2EhHVJJsPkK9XZiG9Bs40i4RbRQ+NMMwodlzVvIP5EljU
         qFNE/3V0zmamCqqu80wI9/fIf62DmXjaiTTvVq4MUbOjce9VWXiSsmKUuG0k4u/XvWsk
         rR4dpnx0Fnv35LeJ0SWeb8YuAea6EPYfKu1aLOIt0bLqxgMLHp1m/USlWlDoh3tcU+dS
         54eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769550805; x=1770155605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wz0uqWgQ1hdqBdE8i4ul6Oa/CAVX7Z5/wVEh6XPOWlc=;
        b=ob2C/AP8DjFOc4oKIzIQvxQphLFb9sRiFGo4Yq/MCmMmUA/VQV2EUcd4xlA6S+J1ka
         NSkaGr0sXG5qRMQ7Tf4oDWmC1Cq/9kaUQi/WPUBV4aPCL0eThNeacx6UHX5qMeweVbPo
         +CsUuY76YHbJkXWd/B/Z52Gb1KoccXapuu8tUeIHT356kS9E35Dr8mLHYnLJdrjjkA+V
         ipEwzeK9lY4osixOWe5Dj7bokVZUk59UbrxYOff/evmGfn8WztKh+zX4mnjnCaNyFmRT
         btxV0NZ5D2L1ciSmyWI0gW/dKQjhUcOBewG0PU3rWNpaEV/mbQYlL8S0VwbBf3+xdWyb
         wk3w==
X-Gm-Message-State: AOJu0Yy7IryxDurynr+dTo1SgK7pG15aecC6kgj4U7vX0qfF1tJyNra9
	rEYJwp5qHIuGLNTBM9TUPIkgcBR+ZZQmMJ2DA9uvL8oKP7WULijM4py/eWj/76gYpu7d2fobxLS
	oNBgN1iKtgaNh6OGHWjxNhGM2FkOvqOLy+l6Y0KWFNqhY5kHIekdZH4Zc2OlQ724X
X-Gm-Gg: AZuq6aLFL518RBH2Vpk2p+lbPnx4tE9DwGmGR0nini2fCJjwiyhBac2UPmlTH8RbVvu
	udeJ604saRXWFlrytOMZG4RFZ74ROjy1jJ5Toe/SpOr5ywCzBg0sW3syfgfFuNPyaxId4Gn/XCv
	VNb+ifbkmOdjjaML/KAsoWAmb7tkBwTI3y88/XsfzJiC6uz9SZhWtKj5lBf2pQueXAxiQ0e5i3/
	2d4EGcgwVcYFDMcc2r/5/dOILZvUa5Wl+u3GfQOsFzGFf8obL34tsZhGbJa4AweL4ow1wBn8/33
	EJev4Rd96Z6Ww9Hx8ILUP/hSDzgRIc7Zd4KAhRTJiWlH/zvYyU7knYgFm1H5lJkeROpAJCS1a2j
	8ctv1XSdiBIRcMUh9lCKrks/lfvTEPNCyW850TV/BWuW++h0rSfCJczjnB9OQlCYVb/pCimS0P+
	nXWg==
X-Received: by 2002:a05:7022:90e:b0:11b:f271:835a with SMTP id a92af1059eb24-124a05796c7mr1775790c88.3.1769550805249;
        Tue, 27 Jan 2026 13:53:25 -0800 (PST)
X-Received: by 2002:a05:7022:90e:b0:11b:f271:835a with SMTP id a92af1059eb24-124a05796c7mr1775771c88.3.1769550804792;
        Tue, 27 Jan 2026 13:53:24 -0800 (PST)
Received: from lola.lan ([187.183.40.109])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9cdcbcfsm31627c88.0.2026.01.27.13.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 13:53:24 -0800 (PST)
From: Daiane Angolini <daiane.angolini@foundries.io>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
        Daiane Angolini <daiane.angolini@foundries.io>
Subject: [docs][PATCH v2 4/4] docs: Fix sources as required
Date: Tue, 27 Jan 2026 18:53:03 -0300
Message-Id: <20260127215303.512936-5-daiane.angolini@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260127215303.512936-1-daiane.angolini@foundries.io>
References: <20260127215303.512936-1-daiane.angolini@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LJjQ5Ksj7UXCENOcFMRjXfCognAW2LrA
X-Proofpoint-GUID: LJjQ5Ksj7UXCENOcFMRjXfCognAW2LrA
X-Authority-Analysis: v=2.4 cv=UPXQ3Sfy c=1 sm=1 tr=0 ts=697933d6 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=PIITv4rVe324bgT4salBLw==:17
 a=vUbySO9Y5rIA:10 a=9UA2AVYIz8kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=1OdKnqY07euSGrlipCwA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE3OCBTYWx0ZWRfX5cvmI6RTUKhB
 Ruxaj+iK8XX55vIYn9azlqb+Vbz3eMeaB0CaEHLhqGqtVnksRCP91Tu7Fi+xuVn/IbzIFFzSw9Y
 bO3+Wr0OjXZDpoA9/pG8ja/FC4UYa/u7TxesbDN/G5h+Qkz9lH4WbcWjMheYcpoZabysecC++dB
 C8yvmYDxfTkP2P8VKXjzWX//8E+W8kMEvS3d+Qb4guz4E18DCJV0931UcFqzscM3TBOzYm/UnO5
 4QDEjuf6rHKrbw44/c9kld1gNojMzvrbm7bwH1pLHGQzsMRenC84vNrqayccVag3z0ObkseeSSC
 +0S8EH7B8rtY8jnBPM7pvapej7lGYfK/le6UNjNkLHTN6pVQ0cIAqbr8wU6cgrv5QOMXwTDzZVu
 ELubt9m72siKC3Rhv5O2NzOudbmjrk1Cv+p3WjuE4Xc7A/Nwhn/wbVXJcupAaJSTx8qHE2AORCo
 wLxu3mbjO8DkVyn86cQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270178
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 21:53:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8754

If sources is empty, nothing happens. So let's just not say it's
optional, and let's say the minimum is bitbake source code.

Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
---
 .../bitbake-user-manual-environment-setup.rst               | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
index 8d86659bf..fdfefac0e 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
@@ -660,8 +660,10 @@ They contain the following sections:
           "description": "OpenEmbedded - 'nodistro' basic configuration"
       }
 
--  ``sources`` (*optional*): sources, such as git repositories that should be provided
-   under ``layers/`` directory of a :term:`Setup`.
+-  ``sources`` (**required**): sources, such as git repositories that should
+   be provided under ``layers/`` directory of a :term:`Setup`. Although the
+   list of sources can be very flexible, at least BitBake should be cloned
+   to generate a :term:`Setup`.
 
    Example:
 
-- 
2.34.1


