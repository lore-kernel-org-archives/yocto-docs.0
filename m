Return-Path: <jose.quaresma@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2363C61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 13:07:00 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29119.1788181613923032361
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 06:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=FUn8h0WP;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=b2Sk37uT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBA7Z63517864
	for <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 13:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KI8H2Fl97DlCf/1IDdvwaKwX
	wGf5q1400+EAmuoyb7Q=; b=FUn8h0WPGVyT9p0qkoC1jgB05aPyJCzhhzv1lTVQ
	mjFudAKeQJ2W6c5oQu059Y1H8x7NpWgQoMRJqTrK8+T8nM6rYJfE5vmBWZF13na6
	/JWRCDAsPAJcES3ymQBbvGWTWxGO8zkuu/1K8SpY4XAfW+K/zECuromu+A/AGr1Y
	AyqXYKGSYI7fdPklw7OJi3+rTjxVlfOJ7wt7r1atM6XmRqKV2Z8KTUY6vhyg6FBV
	MC1gEgHUKMzZTWAyIM2euUJDqB8zV+uedQLWZla2zm8gL0FE9lO8MjjglOUVNKl7
	WyI8AXOJtmdBFwFSEpnQ7/DsoLRaS3YzkTG1qqHQx7XckA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6h90yrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 13:06:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93771aa0379so944720785a.1
        for <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 06:06:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788181600; cv=none;
        d=google.com; s=arc-20260327;
        b=H4NN0QJxSXgE6//aNY/JhHIo4ysqES1AvLyI75VlfyzlzQ2pWQog0Rs3XpB6708aUa
         nQQpGoWqBCuJt80zwwzVt4dIHFLKE1AD3vB0rUBcvZlG0/BSwUgEa1Aouw+ECTZ1tt/A
         V2eGzpEGW1gYftFxMM1ccK7O89Z5bUOEGaiPs5+rH8gR4Bp99EfEzwIBDlfGb35WrP9D
         dCAFu/LiqDNOJFipjNjVyfE4KJ5/IPsrjfSpGP0+c91taEbgT2D96yMZF8Ygpj097yXK
         Z9i0YrwThQ4PMgStvUKOkB9IIOqgQn0FuzmgLWY8oJXey4HdLqFE02+MSYbfa8e8hvp4
         UZpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KI8H2Fl97DlCf/1IDdvwaKwXwGf5q1400+EAmuoyb7Q=;
        fh=4hS1yeconpIjCT2RpsjSCX8nsHAojH08ouzykNU7bCU=;
        b=Dw2SCY95U8vhQi5JezcNNdN3x9AJiQC9cIEVRp3zKWc6UHmCGLz489iNWTn2herBLP
         +hPOiwmR5vFA13/NdumrGL/aQ2AfePIvEDbuptcfNkLeJiDN27ZjV3BVoIs9FCVBsmKi
         eue26dtHmE+ZR0TjFXUba06RyXChPB1xQRu1i1kYNF9q46rm2GuH+c5ejc3GrNT9KSOj
         x6aIe8l/aoMnIZcRm7BMCtXnLvUpXA69M5swoJTP/q5ifFHFc5hMNoN501JMqeC/Z8WK
         xVzAe5YxEKPjFZ3yUZyCRNWeHNaCbRaLV7vZAop+zbTgbB+SlxqQhhVKefSVaGQrZzXA
         XETQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788181600; x=1788786400; darn=lists.yoctoproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KI8H2Fl97DlCf/1IDdvwaKwXwGf5q1400+EAmuoyb7Q=;
        b=b2Sk37uTE7y1jUVccp96RE1GlO5BpYXOMRlTqLNEpyf3bTwjAaFPrjKU/ChgfKEBQp
         VqEGlZwKfdSlbu2PvYsqMQu8qJQ2LfChlY9bDUSR5l2SabxsIMefVMqvGbOMD+3AA0DM
         XPXMb/YHyN9wzkl7EIN8tMa1CgCmkhFmlWpgQmPOF6GuPzdz0or438KzPsEh/369Gcfr
         8ypqgaAaIhBaIKcYcuTiEsBknzN56PgYyG1D8K+CxhP4CqFw2BU0/zBTc5lm93Ss6/37
         Fvu9W5p7I7za1+TFuVLOc9nedee3QAP7UtechGofofUQd+gJnh3CxGgYYiiZi8hEC5Wj
         tOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788181600; x=1788786400;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KI8H2Fl97DlCf/1IDdvwaKwXwGf5q1400+EAmuoyb7Q=;
        b=OFRnkaxOuUeSes4QcLmNzL161ieGzdm57LaXKTv7D7w4W0X3FRd/4AenA1B0lMH8Gz
         eWWVRVew/1rvz7g91BtcjQDqwHDS5lCGgJ9kLE6AOhFjwzQVQMkhiyjVSdT0EHLFfdmb
         OAFdaO/L/Y4Re8yErGcuqR8ij0S8UDa9iURXbnyVYwyocVRItc0Sf4h8+TWoERhahjhu
         /voAsU+wAJOhTpxfNGGk+TX+xkuxnP0ESt+t11gCIYkH5OD6XR3NzSMs2sDIjc4sRInj
         MelOYL3Lr5wa3jqyEpUbS7XxlhQE7jUyFUjsAU2k9WpN6owarAIHm04DMCe0wmz4faSF
         pjDQ==
X-Gm-Message-State: AFuF++mqnulauT/d1Zyz9AJAhK6TXjUAe++roxmZoOZOo0mckFHWbljz
	jfs9p3Gf5ymFRbRW03Z4RkvcwxDVSkTOMHQiiB3NactfNzRT8//j+WSQ3sVW/08s9ZKoO9Av9Xm
	U8xFYAGBlS0VSggJBW+pWmPHTqsOM4ALzBr7VCJvVId+pnyVCmHDegDs6CjLYsf1dGrL4/OtchO
	oUEovwJZ3BXR1CNGsqKD1Ok4IS1T1xeoby1kZQBhmH
X-Gm-Gg: AR+sD12vzqC6/RkXmPBaO6eJWgp3a+Aw5chVRM49gFaulp5mP9fJLDyi/kJsCqWVj7x
	ZbBS3uQ/qyitjOSuvuz6M52z09/UpdrnyNr5u5B8yeMx2Ge4Prisu4mAV8uHnrQIB3b/2jg5f3y
	Gvu1x4ujjkfS7qvUQeJm/QQnFEJI685fkR26PP4jDdIJa2GZJI0Zmq1qgCl+0=
X-Received: by 2002:a05:6214:301b:b0:90e:8027:780a with SMTP id 6a1803df08f44-90e9296ca1dmr11911256d6.16.1788181600234;
        Mon, 31 Aug 2026 06:06:40 -0700 (PDT)
X-Received: by 2002:a05:6214:301b:b0:90e:8027:780a with SMTP id
 6a1803df08f44-90e9296ca1dmr11909856d6.16.1788181599504; Mon, 31 Aug 2026
 06:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260831095856.2298-1-jose.quaresma@oss.qualcomm.com>
 <DL322H0N4CF5.IO2KG3IOZPKD@bootlin.com> <CADWMC-bO57E5JZPfNXCp0rjOH-hGyWGyF8_bnBrvf8NrHRaDjg@mail.gmail.com>
 <DL34MCC6G8T0.12NMB0V503NE4@bootlin.com>
In-Reply-To: <DL34MCC6G8T0.12NMB0V503NE4@bootlin.com>
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 14:06:28 +0100
X-Gm-Features: AcwNN1WluFeqflcQ3D9CPW_XLb1OWxK_6KNNl5WeJH0SyDgJ8v-bbMegXndJtho
Message-ID: <CADWMC-bz-ukZqh1ZCj-0xL3Fi7S_ynaRRXiemFZdVZhNur9pkw@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual/system-requirements.rst: add ccache in distros
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000008716f065a5779c8"
X-Authority-Analysis: v=2.4 cv=W6UIkxWk c=1 sm=1 tr=0 ts=6a957c6c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=P-IC7800AAAA:8 a=rVH46BP-5R7u3nzooPIA:9
 a=QEXdDO2ut3YA:10 a=MOQu8LTPZLqg-_BTD74A:9 a=BbpdpTsBa0vQuaJa:21
 a=lqcHg5cX4UMA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: iTSc-zIs9kIrPRxJREhqeiHzB2ta47D5
X-Proofpoint-GUID: iTSc-zIs9kIrPRxJREhqeiHzB2ta47D5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDExMyBTYWx0ZWRfXwRGnpaFjcW5f
 MQF1Z2rJyI3hUcBsUMpxpO85PL4Egh8HYpMxRFGnlz2JiLwUpMaKSsCWh4+an/oEtm5gO2BdtqG
 2Mdatk4mHK2nrPfgthb1k/xDzgjSQKI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDExMyBTYWx0ZWRfX1XnYjNkhPo5z
 Kd4Zbj7UFvwd8LrksTOJ0OK2koLSeMRLnzx/WLkKZbuqiy/YA0apzpMX02uuuL0onD/XZnocLGO
 0QXq3CXh3Ic2mWQIyY/tLrwY2d+ctk0fUp5FoacfTc6Bu3qYFTnJy3qjbD55+EC7V6yeLZPTVum
 QfHPDOYTGRJg+iDfdpa7MnevRIy8TEFraMK3Pwjvk3PNkf38BqrVuTPGAxQZ33its4p+oHLJf2V
 QmruW+oUh4/hN6tTumxix/n7s9r0/9m42MkdnfXUVoEu/hGCh0so0LSgf62H9epNwCh1+GujmxX
 ushrm1ornMN4Sco6YvNj814SI0qTa4GSRn7MEMFQLUyMGvP3aI++iIBof9HTDtJ0pcOoT0bGb/n
 6IhNizgphEEFprda/RMD48D+Y4Yx+/07JgUcL5u31GwV8nDLzTquE2be8nWpvXGDwea3q4FJ+N2
 +FymcmEpInTrN/2+MJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310113
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 13:07:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10422

--00000000000008716f065a5779c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 1:26=E2=80=AFPM Antonin Godard <antonin.godard@boot=
lin.com>
wrote:

> On Mon Aug 31, 2026 at 12:48 PM CEST, Jose Quaresma wrote:
> > On Mon, Aug 31, 2026 at 11:26=E2=80=AFAM Antonin Godard <
> antonin.godard@bootlin.com>
> > wrote:
> >
> >> Hi,
> >>
> >> On Mon Aug 31, 2026 at 11:58 AM CEST, Jose Quaresma via
> >> lists.yoctoproject.org wrote:
> >> > Looking at the Yocto docs, ccache is missing on Debian/Ubuntu
> >> > and OpenSUSE but is in all the others.
> >> >
> >> > The ccache can improve significantly the builds speeds when we can't
> >> > take advantage of the bitbake sstate cache, in such scenario we need
> >> > o compile the code. The cache storage needs to be available from the
> >> > previous builds so we need to store these ccache artifacts temporary
> >> > on our permanent storage.
> >> >
> >> > The ccache is required to build "-native" packages in oe-core
> >> > because it requires HOSTTOOLS +=3D "ccache".
> >>
> >> Thanks for the patch. Actually, it makes me wonder if we should rather
> do
> >> the
> >> opposite and remove this for all distros, as this doesn't sound like a
> host
> >> "requirement" to me.
> >>
> >
> > Yeah, This is opcional and not a requirement as you said.
> >
> > However, this can greatly improve build time. So it fits in the same
> > category as the
> > python-websockets, which are not a requirement because upstream hashequ=
iv
> > server is not enabled by default, but it also appears listed.
>
> websockets became a requirement when we made the "poky-with-sstate"
> bitbake-setup configuration proposed as part of the choices when running
> "bitbake-setup init". It would have made no sense to suggest a
> configuration
> with a missing package otherwise.
>

I completely agree with what you say.


>
> > To take full advantage of the ccache.bbclass, you need to have the tool
> in
> > the host;
> > otherwise, you can only use it for the ":target" arch.
>
> I think this should then be stated in the ccache class documentation, in
> documentation/ref-manual/classes.rst. The host requirements should be kep=
t
> minimal, IMO.
>

The documentation [1] already mention the requirements for "-native"
targets:

ASSUME_PROVIDED +=3D "ccache-native"
HOSTTOOLS +=3D "ccache"

[1] https://docs.yoctoproject.org/ref-manual/classes.html#ccache

This requirement was added last year
https://github.com/openembedded/openembedded-core/commit/cc91a0f6500e88dd96=
a56307226fcfd16c60c342

Jose


>
> Antonin
>

--00000000000008716f065a5779c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 31, 2026=
 at 1:26=E2=80=AFPM Antonin Godard &lt;<a href=3D"mailto:antonin.godard@boo=
tlin.com" target=3D"_blank">antonin.godard@bootlin.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon Aug 31, 2026 a=
t 12:48 PM CEST, Jose Quaresma wrote:<br>
&gt; On Mon, Aug 31, 2026 at 11:26=E2=80=AFAM Antonin Godard &lt;<a href=3D=
"mailto:antonin.godard@bootlin.com" target=3D"_blank">antonin.godard@bootli=
n.com</a>&gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; On Mon Aug 31, 2026 at 11:58 AM CEST, Jose Quaresma via<br>
&gt;&gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" targe=
t=3D"_blank">lists.yoctoproject.org</a> wrote:<br>
&gt;&gt; &gt; Looking at the Yocto docs, ccache is missing on Debian/Ubuntu=
<br>
&gt;&gt; &gt; and OpenSUSE but is in all the others.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The ccache can improve significantly the builds speeds when w=
e can&#39;t<br>
&gt;&gt; &gt; take advantage of the bitbake sstate cache, in such scenario =
we need<br>
&gt;&gt; &gt; o compile the code. The cache storage needs to be available f=
rom the<br>
&gt;&gt; &gt; previous builds so we need to store these ccache artifacts te=
mporary<br>
&gt;&gt; &gt; on our permanent storage.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The ccache is required to build &quot;-native&quot; packages =
in oe-core<br>
&gt;&gt; &gt; because it requires HOSTTOOLS +=3D &quot;ccache&quot;.<br>
&gt;&gt;<br>
&gt;&gt; Thanks for the patch. Actually, it makes me wonder if we should ra=
ther do<br>
&gt;&gt; the<br>
&gt;&gt; opposite and remove this for all distros, as this doesn&#39;t soun=
d like a host<br>
&gt;&gt; &quot;requirement&quot; to me.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Yeah, This is opcional and not a requirement as you said.<br>
&gt;<br>
&gt; However, this can greatly improve build time. So it fits in the same<b=
r>
&gt; category as the<br>
&gt; python-websockets, which are not a requirement because upstream hasheq=
uiv<br>
&gt; server is not enabled by default, but it also appears listed.<br>
<br>
websockets became a requirement when we made the &quot;poky-with-sstate&quo=
t;<br>
bitbake-setup configuration proposed as part of the choices when running<br=
>
&quot;bitbake-setup init&quot;. It would have made no sense to suggest a co=
nfiguration<br>
with a missing package otherwise.<br></blockquote><div><br>I completely agr=
ee with what you say.<br>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
&gt; To take full advantage of the ccache.bbclass, you need to have the too=
l in<br>
&gt; the host;<br>
&gt; otherwise, you can only use it for the &quot;:target&quot; arch.<br>
<br>
I think this should then be stated in the ccache class documentation, in<br=
>
documentation/ref-manual/classes.rst. The host requirements should be kept<=
br>
minimal, IMO.<br></blockquote><div><br></div><div>The documentation [1] alr=
eady mention the requirements=C2=A0for &quot;-native&quot; targets:</div><d=
iv><span style=3D"background-color:transparent"><br></span></div><div>ASSUM=
E_PROVIDED +=3D &quot;ccache-native&quot;<br>HOSTTOOLS +=3D &quot;ccache&qu=
ot;<br><br>[1] <a href=3D"https://docs.yoctoproject.org/ref-manual/classes.=
html">https://docs.yoctoproject.org/ref-manual/classes.html</a><span style=
=3D"background-color:transparent">#ccache=C2=A0</span></div><div><span styl=
e=3D"background-color:transparent"><br></span></div><div><span style=3D"bac=
kground-color:transparent">This=C2=A0requirement=C2=A0was added last year=
=C2=A0</span></div><div><a href=3D"https://github.com/openembedded/openembe=
dded-core/commit/cc91a0f6500e88dd96a56307226fcfd16c60c342" target=3D"_blank=
">https://github.com/openembedded/openembedded-core/commit/cc91a0f6500e88dd=
96a56307226fcfd16c60c342</a></div><div><span style=3D"background-color:tran=
sparent"><br></span></div><div><span style=3D"background-color:transparent"=
>Jose<br>=C2=A0</span></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
Antonin<br>
</blockquote></div></div>
</div>

--00000000000008716f065a5779c8--

