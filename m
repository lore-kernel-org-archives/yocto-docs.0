Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F91D2FEEE
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 21:53:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1278.1769550796957692893
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 13:53:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=h++2M2fT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.168.131, mailfrom: daiane.angolini@foundries.io)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RJ1CgL2438589
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 21:53:16 GMT
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by355rfr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 21:53:16 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b71d3ac508so5764546eec.0
        for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 13:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1769550795; x=1770155595; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4QGykXcHNBCzD4a9WrSHB7YM+MoKuxAs38SRHDzn45k=;
        b=h++2M2fTssisDXc+mSUYtYaL+bKQydPvWI3BLswPcn09O4uCGtngNW+n3KX0T90G5S
         UG2GcON80sBvmm0/jLm8gRL1WZX75N3HW/4Ce2Ii2dDBv2k1cagyi/et3HW6qH2+wBgO
         z2qWgWZFsnqylwhtKChVh0Mx/dDXGvrLq6fDhu98OsSmxwKobNYP5ayhdAyoqPBh7IsW
         EIK04cC7GrN301OJrhyBN4kH6CcFJaWP6T8Z+mOwtN64aNlE/pMI7906HLOEsnYmKJIP
         m1DgO5OO/JEQ0R4X8OFVYd7ezsO4cJJ5MdPaDF46qobFixoP0BJCNQGVm8Gc7PSwuSC/
         t1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769550795; x=1770155595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4QGykXcHNBCzD4a9WrSHB7YM+MoKuxAs38SRHDzn45k=;
        b=TBBqddgXmtzennKXXye9cHegypwH1DqubxGKgobqxevVyUgmoBErLJq1aSY4S0qdG3
         sJOZvmoLGIMA9oOUPZgnhXIsj5u4V0I94ySriERZjElvgX3EwH87qH/YxYC6plJaRpXt
         PSF5VDI8ITSB38q1op+urMTVjjOB4QitLjoVNz4bp1Qx2+QGMqtaSWoSx3BCcrwxmbV5
         VBYUO4Hg5dbFAPEp9G5mDCyMFBjbZi2KfH2wUvWTXjLZ4HfvLM1zvpHwbdCPSE8V73ob
         pdURIUEWf7WPn8+THO8mEmWYr+uzAMsgqRhGpKh/TqWxSolUw8lcLanwsuxXAgDCVg2D
         TWKw==
X-Gm-Message-State: AOJu0YzD5HoDrfJgUHrNGiAnEalw9jGbopMgtQj17oMzVkxzyFOJwRQw
	iWBhGMQtDY0AWf3+rS4lQsoEX/3BW607eb+MjSMpCeUYTLPrCjDvqGmoNuqc9II52iQ/96BPnQb
	KldKb0pd9bJLzeZn+jA2/b8VrikxVwRWFCmq8+uq0qY6GFT9j7JrEK8WtJ36dIewQ
X-Gm-Gg: AZuq6aK9A0vxDvePHTSUMsiEmNnCsdbeQQsYrOER5bN9pTZ5JHgiP418yb3+hOewkfU
	GkwT7unO/dZiwczHknDg4Qhqld0p4IyKCXde/YdILkHmPG43GchqyeIrt+2PtyuJhO9CfLjjBav
	b6ZXtUeHpT2k+U0RR7j+UevJGBqe+xqRxkVCmLmVwGkeCkunYZITuh1j4OoKyC8btKdAZ3Bk7nP
	ngBCZyNyi8BEyDSjwUqaX9T3z2n0zwIuPM5107bTUiXOaWoUAcWBtDAJ7IWyssxhZDV3OMuWMlA
	2Dj/Ve9MEXinZufZQQNVCIUsacwNTJeEBR1vh2c4zxsK3Xata9WcTTk9rBdDov4cDn91M7u8rwz
	Q7jZHeEYlrpAQ6SkqGdJIzqaORKS4E5/xwVFOdFsdNw6obkNNTFimNFJkFRH2YgWMR5APzzwHnv
	BMIw==
X-Received: by 2002:a05:7301:fa8b:b0:2b7:2ae8:9b0d with SMTP id 5a478bee46e88-2b78d8a8ce6mr1836495eec.3.1769550795647;
        Tue, 27 Jan 2026 13:53:15 -0800 (PST)
X-Received: by 2002:a05:7301:fa8b:b0:2b7:2ae8:9b0d with SMTP id 5a478bee46e88-2b78d8a8ce6mr1836483eec.3.1769550795131;
        Tue, 27 Jan 2026 13:53:15 -0800 (PST)
Received: from lola.lan ([187.183.40.109])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9cdcbcfsm31627c88.0.2026.01.27.13.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 13:53:14 -0800 (PST)
From: Daiane Angolini <daiane.angolini@foundries.io>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
        Daiane Angolini <daiane.angolini@foundries.io>
Subject: [docs][PATCH v2 0/4] Change terminology
Date: Tue, 27 Jan 2026 18:52:59 -0300
Message-Id: <20260127215303.512936-1-daiane.angolini@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YNWSCBGx c=1 sm=1 tr=0 ts=697933cc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=PIITv4rVe324bgT4salBLw==:17
 a=vUbySO9Y5rIA:10 a=9UA2AVYIz8kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RadlWFi-fh3R0DILXfQA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: T3H_5Q6zeQ5BBg2bQ5UykZtcSUfDrEzd
X-Proofpoint-GUID: T3H_5Q6zeQ5BBg2bQ5UykZtcSUfDrEzd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE3OCBTYWx0ZWRfX+DNU4o37zdMZ
 3oYqBxroFhOn9CgRxOYrOeUa8N29rJmV4zgcY6OsDLj3ZNvPtay7eADselY68xsLrnbyh7TF3q0
 pnWi7YjFRsfgh26V21vuxbqCVpkNkSqA3s2LVFuVXSKOYtwBEtmpAmYG6q8hVpInci7Py96XehS
 oE21kQG+CiYIBH/+QRVURMTdXaAIlQC6NajqUfmfxbKvPoYf8pciuXSt+rOzy99M/mB1CVK6DMP
 bfgRaEIADhnJ912AAHrD9QdI2ZoqM6ILxf2Q9xfWXIyNVNZTdqPMuQ/moeCKQYcZGtbC77tW9zm
 t2yZWRfAuf4Ii8VudyRjBr5fy087W4hhzS0HGz/pN/JeJsyQxXAt8F69lQXGV2OcOckf6SIu4BJ
 0E/vBRJ6XQ5qIaC3mJZpTUhjDX72L0LjxlMIqUNLkn6l37cnzX+HzqUOwYJmxtCnff9NLd7VtXh
 YrX0y7weEknGiZyxpkg==
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
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 21:53:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8750

The goal is to replace some terminology used in the documentation and reflect
that in the script output.

Change in v1:
  Generic Configuration  -> BitBake Setup Template
  Specific Configuration -> BitBake Setup Instance
  nested configurations  -> Variant
      
Change in v2:
  Generic Configuration  -> Configuration Template
  Specific Configuration -> Configuration Instance
  (no change for variant or nested configuration)

In addition to that, there are a fix in a leading text and "sources" is fixed
from **optional** to **required**.

The commit adding the "Variant" term into glossary was removed.

Daiane Angolini (4):
  doc: change some terminology around bitbake-setup
  bitbake-setup: Change the output to match the terminology in the docs
  docs: Fix leading text for bitbake-setup init
  docs: Fix sources as required

 bin/bitbake-setup                             |  6 +-
 .../configurations/poky-master.conf.json      |  2 +-
 .../configurations/poky-whinlatter.conf.json  |  2 +-
 .../bitbake-user-manual-environment-setup.rst | 97 ++++++++++---------
 4 files changed, 54 insertions(+), 53 deletions(-)

-- 
2.34.1


