Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35286D2F02B
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 13:21:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10894.1769520105871857518
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 05:21:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=BAoPfcdk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.180.131, mailfrom: daiane.angolini@foundries.io)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RBxSHK1193723
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 13:21:44 GMT
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv9k5gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 13:21:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0f0c7a06eso43502165ad.2
        for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 05:21:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769520104; cv=none;
        d=google.com; s=arc-20240605;
        b=lKYztrTaGPgCxzaiUseVyqDC4SRqyk6ubdswldEd67ujM/1OnmIZpRcJtuoVOhurc2
         O/6WwYkptAv0Z5JeavOn6f5sedfvJDUTzdKTJYOJuuW5z2VMpa5PUonHPYNtpZtiLB1l
         ndGfhkwUHig74PCFDtT2d/fActgA2hQmjPOB4RZ2SRghm5kTfkL5VRxy3GrUFsCUUFZ1
         IcMLxrGDnl1iz482aBBm0p0W+wQG9sA6Zw0LcPRWYh5HyosRrjJ3zIGk9vUlLcssTTbk
         LTK6tcfjDr8Q01VPPHXI0roTnqnOx9Q+gK7fJfXiVou2MzX4Ov05RbWvZRMuEm8Yz7gi
         oeiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=je2IuncgIfRBkrIaSPK+sCxxKtUxxGJ3zqanMM8wsA0=;
        fh=BY4Z5tGfzckyTHYSLriql1zfq2+ExSt8pTfQRnud5ms=;
        b=CavrHjsr5VCrxQUlqsk8GMSyhgKaQ6lfxo+hYGFJ5v4Lp2dxCZCk+DJioVapiaylls
         nkw7bFPh6S0aoq7Ix9DnnJIre3GIpiwPZGcbjDTVRPReRPYuf0ova4jjCuGVLx6FrPNJ
         uBCeqxgp2rBzeE3k7q7vhX5sHO3ETCRdUbtNV4rXMXyn06LIHqKvDtjCU5kCC058uRj+
         B6u622a5pqafHtJVUPdTfkQfgaGemjVwSyPdgmJdLuopkca11shd+sW0JrGK36NLAPCX
         yChe+PFGi01J8LEiA9qDKy6vqFuHjWdxbcG5HcLVlHqBPyTjSkWL+sd6MGVqFxg3GKsF
         dB4A==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1769520104; x=1770124904; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=je2IuncgIfRBkrIaSPK+sCxxKtUxxGJ3zqanMM8wsA0=;
        b=BAoPfcdk/MmK1s1wWdbgDHGEDMkiYaRSYEdSB/5TWzsLQf6MT0Br9RMVeXOEgh6KTq
         fBfdSi/sIFW5KKiR7r5kG9Pocd+1KPTpuvZqhe/tGg+veFzBx9or7YlO3U6+2LRUnlAA
         NsoTyDcTEdSKpFlUCtM75mgE+65R+5d2CKQndAn2Mm56W4YlzDlgsG1mWd3o4lVFHQ37
         V8UsYCKez8pG+8JA3ouynMFMwPSFNq6SZsXGkzCsCUdPLe39yxh9rbjxSLQ9Ij3t6bXw
         zP0a1EU8+IdVNoCwugxzusgZdCJ429Gb6TLQD45Mdh3WknZ8XsjU/6h1vpNkTMg3L80F
         uyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769520104; x=1770124904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=je2IuncgIfRBkrIaSPK+sCxxKtUxxGJ3zqanMM8wsA0=;
        b=O93EzMbR5ixedcQNv3AGjLhT+etUZ/GRBRfz413XIEU8ro9sv36MNl4lmixBimDoEF
         z43To7yoHkr8Vhw8G8y1n6lRKn5UEidy0Rbu+xCauDv2HWlItBcnimzyD1BNlG+r/2X/
         DYfHL7MGmniLkvY4PdTClKxcIyuoiFIsqtDV8uX6lx0MPdAyi1s+0+CBy3+sULTH0duM
         vln5NO41OORYOPeOm6OiGX6/biFBBP1Dm67WDJ+58AHI+9GUxcs2s/Bdjx5zVYjBkvZn
         LCFhGII5j5fYWN4iTa6e5EgurRdZqpQ1+okeH42QMEAqiMDjqcfSdH3Aq6iKm/C+rdsx
         BAxw==
X-Forwarded-Encrypted: i=1; AJvYcCX4omduRVd1hzTSEUcD9wZQwb4sOk0T3jmET/gZSr6bIUupGDyvVA/20+G5pA6TPwgh/b55@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YymjHaSk85VcobHNWMsKCkF8D0O0R+quj/6Y34qPmU9ZFmag2rX
	vCNLwA34vrpu9rEatPIMzs7B+FokLJiENVmCGx5/YjkJZoL3JAt2+3YtbAGLaKYIizSyVSP0HAW
	mvKmpapNhSYkyq5JLizYfXw4aZwGNpunCWu2f/CCH9r8gIE3yWrQy0va/Zk4c0oT2lYAO6DmMQy
	aDzVJALfdQVJmfFE8Bz6qiXb5d01GLf/ARz3+D9xw=
X-Gm-Gg: AZuq6aLlLXjNzSN6dTuzBbnP9/iYW/2CEC/y7ooOEm6BEgCmkh7A90edOWjMPRbhvGn
	HQVLDjlz894dGIIoY4PrIfUelVfevQvEMZbef6DQ8g5U5dw5dNJA985ZqkXsIqZknQtsIxvEGjC
	IBymvdrF/mGac1NWG9FTNuNyN/sXjPjxuPU65RZ5OKvDgR1XZlUWGADPgHCNvxDG6Di/XVYxDfy
	jc47zIIxFiW9lKvjXVlI2nF8LM1Uy+ulDEQFruJJf5zS+lFpA2+2qIX
X-Received: by 2002:a17:903:22c3:b0:2a7:c8db:4884 with SMTP id d9443c01a7336-2a870d4925dmr16850465ad.12.1769520103625;
        Tue, 27 Jan 2026 05:21:43 -0800 (PST)
X-Received: by 2002:a17:903:22c3:b0:2a7:c8db:4884 with SMTP id
 d9443c01a7336-2a870d4925dmr16850215ad.12.1769520103209; Tue, 27 Jan 2026
 05:21:43 -0800 (PST)
MIME-Version: 1.0
References: <20260126222743.411405-1-daiane.angolini@foundries.io>
 <20260126222743.411405-2-daiane.angolini@foundries.io> <DFZAUTK11Y5A.1PPDDZRLH02PU@bootlin.com>
 <CANNYZj_DhwvpzBcG0Vi7E9aYqx7b30uDUxJFkmdE686f1+Zkog@mail.gmail.com>
In-Reply-To: <CANNYZj_DhwvpzBcG0Vi7E9aYqx7b30uDUxJFkmdE686f1+Zkog@mail.gmail.com>
From: Daiane Angolini <daiane.angolini@foundries.io>
Date: Tue, 27 Jan 2026 10:21:31 -0300
X-Gm-Features: AZwV_Qi7dDGQhhkW2PeNI_ZTeO3GV5FcYw3Z5_1AmhueG_CWp6YRa_c8_Sd89d0
Message-ID: <CA+HEL79Bs-OaWjNa2OSrVULiBqpeXU_0m1u=vUwgh3cXWXY5uA@mail.gmail.com>
Subject: Re: [docs][PATCH 2/5] bitbake-setup: Change the output to match the
 terminology in the docs
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: antonin.godard@bootlin.com, bitbake-devel@lists.openembedded.org,
        docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=OYOVzxTY c=1 sm=1 tr=0 ts=6978bbe8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=LVY25okwlNza5Yhv:21 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=9UA2AVYIz8kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=iGHA9ds3AAAA:8 a=QywrWj0JBaodNPk8WKYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: oiZ4ry-CVoBmv0d8oHTwvYLcNQK-Azho
X-Proofpoint-ORIG-GUID: oiZ4ry-CVoBmv0d8oHTwvYLcNQK-Azho
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwOSBTYWx0ZWRfX/JDeqzNR1MRb
 Md8LGaEfXVPlGxK9jRcugdtKj18wZn4B+oAn0DomrAgxRTKNiC6gh4EZNY30DFN8pJom9tmr7IE
 gTcP/cPmB4fW8U61NhggDQ4rfd7xWNgWQ8oSD2JTKGckggu0EeawzAcPwdc2Mr/xfpTSB/rtJ3K
 s6vEVs5QDi5mRF7WClgFlXtuc/V4njIeaEdlTsoYEOOgmAba54oXU7I0s35XJFAZ2WUf9eIx4oE
 /au4N9t0iyWiemnOdhtWNeQw+duZutRTd+krl+hL75cSizanSqKY9XsPIUdiHAsusuObBUtC6rZ
 lWRgpDuMNEc3UTs6TMcYW4Q1UkVduhUnsXdKAq87oTay6SEAFgRWkltPVVstiVPV3k5pSCUsog2
 pcZvYz8BF+RHJzkR1a0I4KHIfVVdu0FRLnyyaMCVC+NH9+kmMKrKMdEw+3UmsZ4eT7U5fwKZg3t
 gfMZF729QlJ1eEZRDeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270109
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 13:21:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8737

On Tue, Jan 27, 2026 at 7:38=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Tue, 27 Jan 2026 at 11:29, Antonin Godard via
> lists.yoctoproject.org
> <antonin.godard=3Dbootlin.com@lists.yoctoproject.org> wrote:
> > > -    logger.plain("\nAvailable bitbake configurations:")
> > > +    logger.plain("\nAvailable Variants:")
>
> To be honest, I am no longer sure introducing 'variants' as a term is
> an improvement. Someone well familiar with the terms will get it,
> someone running the tool for the first time will be baffled. 'bitbake
> confugurations' is more familiar and straightforward.

If everything is configuration, all stuff is the same for the
newcomer. Bitbake configuration is the most generic way to refer to
anything. If I have a site.conf with DL_DIR set there, it's a bitbake
configuration, if I have a KERNEL_DEVICE inside a machine.conf it's a
bitbake configuration.

How do you like Fragment Set?


>
> Alex

