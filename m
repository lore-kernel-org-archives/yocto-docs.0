Return-Path: <jose.quaresma@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB63C61DE2
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 10:48:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26843.1788173313943004664
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 03:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=guzDwwpk;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=avDbdZFf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V9Ikm52516152
	for <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 10:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1icBNoMxepFzpCEabY7tv+D2
	OT0rzQZaFfkVa7yQ0HA=; b=guzDwwpk/kqMMw7xFxV/8ZHFxmLM2vter391p8ws
	3NAfz5RGAFj2Ba3DKC5ZQcjvYFAd8or6a5krsAoNAU3NfzAvdHyHcJtr3qQMGtl7
	2D8WCwHWmEk+jbZSq5KaOlXJKT4slpf2nBwHBkH36hpXexsyxsKE18F+8FCfbBlR
	gzhR7CAAD4FXghKdS/4fNfrRaLhrfK92lD4amQPfcCN9gF3SkuCWiqrck9z50Yx4
	xp0B3YQcHF3ZN5fIPa38xF7yyrQFubtD8Mou/HORFjdfz3fi6POtrr5RgHpYnnD8
	kLwjqHpTyGFTtkLOuUcXj1CEt9Fr7b+YUwdLJIRQEM+BiQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6vcrb2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 10:48:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53013dc2330so20398241cf.0
        for <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 03:48:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788173312; cv=none;
        d=google.com; s=arc-20260327;
        b=GBeEJrTMVFXnkQyrJxJWSE/ZGCxN4K7xtFbNwmK1f+VCXdWBocqcwXeRd9LvkkMPyZ
         B/4/DYzO/JJeErzhtCvpAJ4nxvGYqhOZr0mPx7iSfF6o2cHPZMR/hzt+VfjqQvf7tWtE
         2FKaQaZG8Xp16JlsXdwNpS2Rj3oO8q3w7LWVlj9S4oumFMNllFIb4GzgCpjk9XOU6+gR
         gAmkaSPwcFgMMkR2Mh5yV3+eoGDI0v4kvJsSPeYGmdTEYjJ6/C2O6zEVgRhZBQmBf3l9
         M84ZM/9J5YYMDwcxT/llIf8WXSd2OeWIuBcEvuOrF4MdwUF3DJKbCs2dWSpFtuXu0BPo
         Igxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1icBNoMxepFzpCEabY7tv+D2OT0rzQZaFfkVa7yQ0HA=;
        fh=4hS1yeconpIjCT2RpsjSCX8nsHAojH08ouzykNU7bCU=;
        b=IT0abn5+HGodt+kvAYkWOeTFbCCYspQ0HkfHSSEyImbExyAKJf148yVil7yiwQIjRI
         3FQHH4ykK2qfmuBgz/6I6Zj7aywwaqVMXDS3KO08enlyPfPZBsnXbsECz9/9uo1pTIKm
         +Tz79nxcIRvlnTOVSxSI31DGFB8srsPCH6IMJEMdmNEcPKX+W0Xe/p2rl3tFo4BmkypK
         PLb8A/ak0CetJrRuf1/nZmjJ6/qpORVpI4INDNKVTaRvzAGibQc+rm7KqTa7IxFom1nd
         aB+21UfN1ES+38Aj6AU7bAxU5jvOn460mXgRbwlEf3I6E7XL46q7gAStKAXY1aDDA0br
         a3hQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788173312; x=1788778112; darn=lists.yoctoproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1icBNoMxepFzpCEabY7tv+D2OT0rzQZaFfkVa7yQ0HA=;
        b=avDbdZFfqYF/ITfW9p+8rfJU3xTi4q+5HFH31mV37j93FiLXL6ns1yF+SutLsTeOOH
         FAm0UgCmgxcmLzeRTvtkH5v878MyqyWIUqZUitMGmuRv+/FwiLE8FuJlitia4ieEsrH8
         SxYjvZCV6NTj78hDIYYMCnlHtYKxaoDlmo/fjORg7jPqoHqczquTxzCiMj6XsqhXIjj5
         6WS0wa5cIT1xbyKPFv6Yuejzku7UnMKkeIxC3BiCYn2NemVAqRNq2eCKEpE1bxeE8XSv
         7apS5z92aXZLmA9yX4g21wO0/WwBHKsW2zwi1IxDMbmC0qUs2PmcB7Bl5GxUNpQtmRpl
         vBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788173312; x=1788778112;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1icBNoMxepFzpCEabY7tv+D2OT0rzQZaFfkVa7yQ0HA=;
        b=Bnnn1RI6i1ddxsDRz8cFxcYh1eSQF3XBw/bdUJc1TdpNz+rudFpEA3sv3ZBYt9URWN
         Esy42fio+krbzxALm9Yu+JOmSloaXchx4ZH5iYq5tzHFoH65+DE+ygQ6ddlkbm8oPvku
         omMfUk/S0CQ4OvJOgzM7Oo4rCTnwUkQc/jmS/Ik5oc/8+PE+TvMN4z5NGvVFLR2f6Co/
         GWRGSqne/2OLu0fDw6iAUDqiKTepQS5O5Y13V72sfUSnlEKXuY75aEM9ZlnyKGqq88ro
         qgXX04hfYIhLGH1LqQvWdfbD4moHvWAiyCY7XUW01C46ssJYqJVlZ3ibny5NXq1VPyRz
         KBxw==
X-Gm-Message-State: AFuF++maE2DG5OoCPqj/vvEp7HVptAtv94eh1vDBK69jpZaZBGKG9fNO
	CxTbISOka4RPwEtdv0xxEFrUYBvUgiwh5YfNaRkgSk624mejXZqZAQxhRo/Zmj2pPmVMC69oNgv
	njM86Jl5pwwhmHIpoQYzg7aWZBwMr4Ek4Qppqub1IZuEluAauUUhWSWNhbP8LUMECLNuXmrtS/b
	o09Qz1F6l7Sv+cmFABxnzE9LZyIjlAP+9DUvc16eZh
X-Gm-Gg: AR+sD12ZpmEUXsWVzsE/clrPt00ysaVCRCgH9xLXWX9RNvOz+iAJaiBaIwXNHPZw2pH
	EeT0DrMZGyE8w89hZSO8kLEFmqGpNQVJvR5EFylnLiyp/8aIM3PlnLjpCmWt4sEXtCC4X4BsQEC
	NhrW3bpWU2zDEG7QaXw9+cW0yaLvLTFGfeMfo4kVuhrVP9Cry1nEcJBVW3rBM=
X-Received: by 2002:ac8:5750:0:b0:52f:9e5c:33ff with SMTP id d75a77b69052e-52fb93edd51mr306867591cf.13.1788173311942;
        Mon, 31 Aug 2026 03:48:31 -0700 (PDT)
X-Received: by 2002:ac8:5750:0:b0:52f:9e5c:33ff with SMTP id
 d75a77b69052e-52fb93edd51mr306867371cf.13.1788173311512; Mon, 31 Aug 2026
 03:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260831095856.2298-1-jose.quaresma@oss.qualcomm.com> <DL322H0N4CF5.IO2KG3IOZPKD@bootlin.com>
In-Reply-To: <DL322H0N4CF5.IO2KG3IOZPKD@bootlin.com>
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 11:48:19 +0100
X-Gm-Features: AcwNN1VysLHVz9wih5QSpzeeF5E3nTa3I6sJyNKunL5jvgn4_EKLOoqjyOq1jas
Message-ID: <CADWMC-bO57E5JZPfNXCp0rjOH-hGyWGyF8_bnBrvf8NrHRaDjg@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual/system-requirements.rst: add ccache in distros
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000007a5ba065a558b85"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA5MyBTYWx0ZWRfX3ZjxOK277TyI
 MoP4F4tH0JP0vC5VqqPVCXNeW/3E0PZiirQRMv5rG++0nHc1zDCd8kgh0D2ocvmpwu/JNHZuLIx
 Ikx/zcektv2Cq/0aONet0mi1m/cb4z0lAavYdzdO+ADbR/EX+rs+vSvkL0WGI2Urga7/Xd/elLG
 /q75HW8oBbn4w4/FKeByMXcpVqP9AgkYa6ksfyRVfWi7mvSQsFArIaiX9vAlt0YHiXxoxySzOBE
 77/p2YYsb9r8ILG4UGqi1jaj+khlmld1YXIkKZzTF1F8ha/4N8cIkToNGocxcFTChJECrHvun2O
 G3ZJakK3xxn5ZAUUHLJ68C88rzoX2ly6kLPf4hmjqVds4UsUoE89kWzErgQrEDa/ecpW4ZpcQez
 0tzYmgN4Ay4cIRuMryRPGg/fn21hKzpNEhERtscXYjRVM59EJt4XXwVjFkM/HPp18XfZ9Z/dY/N
 ffxY1SEkHx2l8J1HKcA==
X-Proofpoint-GUID: 9siSR-033xdW9Iom2SkL8Wx_HZGYrjbQ
X-Proofpoint-ORIG-GUID: 9siSR-033xdW9Iom2SkL8Wx_HZGYrjbQ
X-Authority-Analysis: v=2.4 cv=Eo7iaycA c=1 sm=1 tr=0 ts=6a955c00 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=P-IC7800AAAA:8 a=iGHA9ds3AAAA:8 a=mvWJzVt7ZQCLnUcyB9EA:9 a=QEXdDO2ut3YA:10
 a=RrVfVAGavR3DoOkTQtoA:9 a=c_pXVxf4leZvDLJu:21 a=lqcHg5cX4UMA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=d3PnA9EDa4IxuAV0gXij:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA5MyBTYWx0ZWRfX4WdyYL+aoKfF
 LoUPVrPyvOKi1dlsrvBQf2w+QwQEzBoAvAfU4FHs403iHvqste2VhftPYPDi2NEERr5g7gjU9Wv
 ZeSjIAR0iRJrKnJYTJyWRB10wcxphv0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310093
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 10:48:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10420

--00000000000007a5ba065a558b85
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 11:26=E2=80=AFAM Antonin Godard <antonin.godard@boo=
tlin.com>
wrote:

> Hi,
>
> On Mon Aug 31, 2026 at 11:58 AM CEST, Jose Quaresma via
> lists.yoctoproject.org wrote:
> > Looking at the Yocto docs, ccache is missing on Debian/Ubuntu
> > and OpenSUSE but is in all the others.
> >
> > The ccache can improve significantly the builds speeds when we can't
> > take advantage of the bitbake sstate cache, in such scenario we need
> > o compile the code. The cache storage needs to be available from the
> > previous builds so we need to store these ccache artifacts temporary
> > on our permanent storage.
> >
> > The ccache is required to build "-native" packages in oe-core
> > because it requires HOSTTOOLS +=3D "ccache".
>
> Thanks for the patch. Actually, it makes me wonder if we should rather do
> the
> opposite and remove this for all distros, as this doesn't sound like a ho=
st
> "requirement" to me.
>

Yeah, This is opcional and not a requirement as you said.

However, this can greatly improve build time. So it fits in the same
category as the
python-websockets, which are not a requirement because upstream hashequiv
server is not enabled by default, but it also appears listed.

To take full advantage of the ccache.bbclass, you need to have the tool in
the host;
otherwise, you can only use it for the ":target" arch.

Jose



>
> Antonin
>

--00000000000007a5ba065a558b85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 31,=
 2026 at 11:26=E2=80=AFAM Antonin Godard &lt;<a href=3D"mailto:antonin.goda=
rd@bootlin.com">antonin.godard@bootlin.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On Mon Aug 31, 2026 at 11:58 AM CEST, Jose Quaresma via <a href=3D"http://l=
ists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproj=
ect.org</a> wrote:<br>
&gt; Looking at the Yocto docs, ccache is missing on Debian/Ubuntu<br>
&gt; and OpenSUSE but is in all the others.<br>
&gt;<br>
&gt; The ccache can improve significantly the builds speeds when we can&#39=
;t<br>
&gt; take advantage of the bitbake sstate cache, in such scenario we need<b=
r>
&gt; o compile the code. The cache storage needs to be available from the<b=
r>
&gt; previous builds so we need to store these ccache artifacts temporary<b=
r>
&gt; on our permanent storage.<br>
&gt;<br>
&gt; The ccache is required to build &quot;-native&quot; packages in oe-cor=
e<br>
&gt; because it requires HOSTTOOLS +=3D &quot;ccache&quot;.<br>
<br>
Thanks for the patch. Actually, it makes me wonder if we should rather do t=
he<br>
opposite and remove this for all distros, as this doesn&#39;t sound like a =
host<br>
&quot;requirement&quot; to me.<br></blockquote><div><br></div><div>Yeah, Th=
is is opcional and not a requirement=C2=A0as you said.</div><div><br></div>=
<div>However, this can greatly improve build time. So it fits in the same c=
ategory as the</div><div>python-websockets, which are not a requirement=C2=
=A0<span style=3D"background-color:transparent">because upstream hashequiv<=
/span></div><div><span style=3D"background-color:transparent">server is not=
 enabled by default, but it also appears listed.</span></div><div><br></div=
><div>To take full advantage of the ccache.bbclass, you need to have the to=
ol in the host;</div><div>otherwise, you can only use it for the &quot;:tar=
get&quot;=C2=A0arch.</div><div><br></div><div>Jose</div><div><br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Antonin<br>
</blockquote></div></div>

--00000000000007a5ba065a558b85--

