Return-Path: <jose.quaresma@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9EDC624D4
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 13:34:09 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8259.1788269648002648702
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Sep 2026 06:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=c6mXDhg1;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=bg8QPB1g;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681DVi2h2663969
	for <docs@lists.yoctoproject.org>; Tue, 1 Sep 2026 13:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z3QCAenSeICp/Z3aw45txcq1
	vEQNKdnxi+6HP0jl8Jo=; b=c6mXDhg1qDMIdizur33uhgr0o+uOxaNaV/HSLfGr
	BCxAEFlRcryFKF+LwxB3jwoXVi44LT9wAIMcxk1/VQAcYITR3RLRwdMWAk5KwniR
	N58xnfEN5phmRJEtPGokYJzaI5Hy3/Zxg4VvnfotYX2UcJSPPBWyCZOeqwboha2l
	Obz0s83EAyoDhZM+JdtbWKYvuM++HATDz241uikbH4nYqohR/EbM1Ar37Kfafb9k
	bjfxRX628YzlstOE1ljFtUNn1Woh75dJQgpfDhJVvs2ueb2zLJAxdIOPm5fCiuCN
	MC3CkqYKQHNK3nJHa/Q83jhTZvjpSQXKiwEgHJXDh7n1Cw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdvmm0sbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <docs@lists.yoctoproject.org>; Tue, 01 Sep 2026 13:34:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938153538caso173900785a.1
        for <docs@lists.yoctoproject.org>; Tue, 01 Sep 2026 06:34:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788269646; cv=none;
        d=google.com; s=arc-20260327;
        b=bCLNDOsG5V6A94lqdB6GHG1v3LjiZeW6NSTYvNcxbDAFINkjpN6NO+PYxGih6/zcNq
         YAsWexd5dCpX/C87wIP6fDrodm1bY2tu4D6rltEnO6BTFYwJHh1R/269MsnvxDGSsxlb
         p+kKvhfJLis02Pdg4F4K+xSXoOwUHvWXwE3rpjJ8KFBxASOus0TRuI3UbLqi6xMspUOp
         N765u4RWdfukMuLnL+FPKKp18a3C/SRvpmN8a0GRuIdU34YiEZFQxzv84+u6rIZ7qrZE
         dBBw6y5jGAPLMhoOi3ssxhqm+FbgIjqQMKunAR/9cSiYF75UU4NA890JgKiqbooPDWKn
         V9uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=z3QCAenSeICp/Z3aw45txcq1vEQNKdnxi+6HP0jl8Jo=;
        fh=KaCPDxc2IAjoPOm/bnJy9CsYIXfgiF4U/fZiIwpacrs=;
        b=R1fjwRQ11Lx8iGa7ffrku29KOm0IXnT9tzAvytHuFsWHboZ7OIBT5OkXGrrJsEBnAO
         xHAC9J6IJ87IAwLF554vbLbfDUUqxILdbkEVGLjthdXbGtSqml2SO6sbxVNCQDl/FtT3
         GU16NAaOL14Fh6QmQ4xUTFfRgnZyU4xvHoMb8I7bm4tTj0izwD9Liqu/bAw/5RtIFY1g
         gK+2NVQtZsux8rW7wDyzjGy5pZakXiwh+HTvxE5jj/qMn7kKwcwBG3WtmgsMZNavZRhW
         WMtT5GIReoor8puf26l4b45Kzep/WJRvtBofUb6/Q0VWXADQnoV0IZMftu0ERtPYnnI2
         hQUg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788269646; x=1788874446; darn=lists.yoctoproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z3QCAenSeICp/Z3aw45txcq1vEQNKdnxi+6HP0jl8Jo=;
        b=bg8QPB1gcJmI7Jh05L5lvtCSCXBcv9axd9+z+cM1JFxnELl8fEpiyHyahXsgybktCY
         9ecNuKkZhVqLZsLXdoQh9t9C6QvXbHvgRYcDHsE0myuM3e/55GUV7j4AfLFQUzHxQ19y
         f+hWIOJAA8+UJVAwuYwR9B2EaDQ5JfBCixxFC1qEjozlh5hA+M6bRMpIdzAm+v5tnvdl
         s19izOz7cyUQ9lXmvopWlOHxhvXeGrakhZVs7NL/Ow8bLwLbwNk0+97JL177KNSJkbby
         Qn2iuQchIoIKLDQR+hzxGgwzJxzksBQ+If/2GXyPORVIIwntdA2zw4AfHVZofkNjQkE+
         yVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788269646; x=1788874446;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z3QCAenSeICp/Z3aw45txcq1vEQNKdnxi+6HP0jl8Jo=;
        b=muENHt42he012s92LzEzrIlFGmJRfESRxvJd5hVjkmgQetZrN1iZwqdOi1vxVzE4HO
         z4xQUF0rBxcPZ2zAAFxWHQX0GI2O5hadLCcFWx5papCQLc/x3gnFEoxuo33PjgPBgiY3
         gFUtm+/ejij3Hp61ddK1WucdlsULC7UqszrFVvLuNIxoQawslPo6FNaEpISocP6rLbLI
         DEh6oRG3RKL6oYd6ah4k5HUjyYaP6WD1nrcSyRsHKn3bHIU+juhLy/5enZaO8qwX03GO
         toVsT0q+4924I5s0/ZhVU4F2oa7sR7YnuO1uc2IcEZ01HGJoEDySbhfXcYJC/c7A3Ipf
         XF+g==
X-Forwarded-Encrypted: i=1; AHgh+RpLiwFpWVEpTsgiUH/vIIT5LOvBNqosMHtr8zb4ahIuOjq384YzvQEcz2KBWfKdeayG4PWz@lists.yoctoproject.org
X-Gm-Message-State: AFuF++lSGNODAYVggnNsqWJ2yMuylQuoncj2kh2bSowgyEGcxN9h4Oum
	5c/8ueb7C/Wi4XWDMmR/JBOO+LjXLWLRTFYgPHRkXdVgnowayP245g5/qAVIJ0pD17MxVmc6tNi
	6bNklBSaTAXK5Vkr/ft/wsqquy2TdiNd6yDvB5RlTbN5tNHfQCmUOZOpdlxdQ3zOKBnX7XuRcxj
	UvKqq19EoDfxEq1CKdcjnFXTpsVDXbUm7J9MELhY3Q
X-Gm-Gg: AR+sD10Pud+OHSpjI+yyv+WgdBB5mHwQpKcGTE5BVvXTXgXGUGUKfLjxd5d9b9EE5OL
	Wpaj3ZUwmetCevLh/2kDtFLeFB2CGw5JhdT9KJXs7RhSG4W2O0JB/SlFW32nX22LeNHuRHk5mZv
	+OpCRcsaQRUPlA1bwlMmrPBLJ1+oMYpsGSH07X+241hCphQYEMBw0nv2BzLPs=
X-Received: by 2002:a05:620a:29c6:b0:92e:7383:4a93 with SMTP id af79cd13be357-9391395ad22mr3621129785a.35.1788269645879;
        Tue, 01 Sep 2026 06:34:05 -0700 (PDT)
X-Received: by 2002:a05:620a:29c6:b0:92e:7383:4a93 with SMTP id
 af79cd13be357-9391395ad22mr3621119485a.35.1788269645217; Tue, 01 Sep 2026
 06:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260831095856.2298-1-jose.quaresma@oss.qualcomm.com>
 <DL322H0N4CF5.IO2KG3IOZPKD@bootlin.com> <CADWMC-bO57E5JZPfNXCp0rjOH-hGyWGyF8_bnBrvf8NrHRaDjg@mail.gmail.com>
 <DL34MCC6G8T0.12NMB0V503NE4@bootlin.com> <CADWMC-bz-ukZqh1ZCj-0xL3Fi7S_ynaRRXiemFZdVZhNur9pkw@mail.gmail.com>
 <178826523033.129557.2771369482806275703.b4-reply@b4> <46683f729dac1a9cba4fde5b597254f20fff9b40.camel@linuxfoundation.org>
In-Reply-To: <46683f729dac1a9cba4fde5b597254f20fff9b40.camel@linuxfoundation.org>
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 14:33:54 +0100
X-Gm-Features: AcwNN1XGYBcIdFxVxk86RsWD4CZGMPylOli_1na8tNTiNAVwTUgJ9G2q4wVwkY8
Message-ID: <CADWMC-bfYQn6gq3R4Rvi_0=Q6MQ=O-sWiyUTAOXVdBJkTQBPVQ@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual/system-requirements.rst: add ccache in distros
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f75598065a6bf8b8"
X-Proofpoint-ORIG-GUID: 9jy3TR72NJpM_X19X8_tAcSm0VbI-hwL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyMCBTYWx0ZWRfX6eXywK9/7wN5
 ASgznLm+HYXWz6jU401TMBHrJ1WJNbHrh/JVQ2rKRQTsdjqbeVv3WdpoDWXte9vIZa6P5+jN7Yo
 APFXa7Ifx7H+TpE8I+xWVXEbEhUOdvw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyMCBTYWx0ZWRfXyBfA1Lb9oCZL
 kZ7MRFpvYNJpApSLeRv15HdUzAouaOAa/jubS8lt+LUSrddQKPxAsa0E17RioXiJC0e1LUw+weo
 MBBLSAjC7DsubGNtG50NCGuvdOak50P+qqGpuyORIDcJw7afh+B0kyj8nlfKJZtYNJS3OsphwV+
 7MvTF5pblB6M9s7A0g9KLvTE5NB9g47L1fUhgowCkZp1UiiEXUUJG+kw7z+egsaqAa3cZazC5+x
 i6kgeP3IXp5UxI3XnxtL3CoU94WjXwRar5Py/r6aYo6QAUEEaTkxSffTn4iSdj09oKeY8GjGJ3z
 XbACSFFyZpjeqrKlKOL5llWyK4dYKNkb6e7V/UlMd8EuxZmZVWJcwGEE9VI/70ziKpNa42oZMBb
 dHkbCECaEtMPPTIHG7y9Oq6EQMoN2HY/+S8vi63DTHVnEpNAXPYviEuV/naO/3ul3QDJXnhx7cx
 2PLp5l+QABOXPof/Olw==
X-Proofpoint-GUID: 9jy3TR72NJpM_X19X8_tAcSm0VbI-hwL
X-Authority-Analysis: v=2.4 cv=GfwnWwXL c=1 sm=1 tr=0 ts=6a96d44e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=ag1SF4gXAAAA:8 a=rX1kzmFWvdqRZkbWy6sA:9
 a=QEXdDO2ut3YA:10 a=M371d1_RAAAA:8 a=Zx-vYLR7AAAA:8 a=qcRHVbX0l8av_VPWpyQA:9
 a=sajtyWse2nWGVnST:21 a=lqcHg5cX4UMA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=7fIwUXihgfxQvi_dFNnt:22
 a=6doKY8E2yMTIlQWiIFBb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010120
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Sep 2026 13:34:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10432

--000000000000f75598065a6bf8b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 1:40=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2026-09-01 at 14:20 +0200, Antonin Godard via
> lists.yoctoproject.org wrote:
> > On 2026-08-31 14:06:28+01:00, Jose Quaresma wrote:
> > > > in
> > > >
> > > > I think this should then be stated in the ccache class
> documentation, in
> > > > documentation/ref-manual/classes.rst. The host requirements should
> be kept
> > > > minimal, IMO.
> > >
> > > The documentation [1] already mention the requirements for "-native"
> > > targets:
> > >
> > > ASSUME_PROVIDED +=3D "ccache-native"
> > > HOSTTOOLS +=3D "ccache"
> > >
> > > [1] https://docs.yoctoproject.org/ref-manual/classes.html#ccache
> > >
> > > This requirement was added last year
> > >
> https://github.com/openembedded/openembedded-core/commit/cc91a0f6500e88dd=
96a56307226fcfd16c60c342
> >
> > Still, I don't think it really is a requirement, and I think the way
> forward is
> > to actually remove this from ubuntu_essential.sh, fedora_essential.sh,
> > opensuse_essential_15.6.sh, and opensuse_essential_16.0.sh so that all
> distros
> > are aligned.
> >
> > If you agree, can you send a follow-up patch?
>
> I agree with this FWIW!
>

v2 sent https://lists.yoctoproject.org/g/docs/message/10431

Jose


>
> Cheers,
>
> Richard
>

--000000000000f75598065a6bf8b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 1, =
2026 at 1:40=E2=80=AFPM Richard Purdie &lt;<a href=3D"mailto:richard.purdie=
@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 2026-09-01 =
at 14:20 +0200, Antonin Godard via <a href=3D"http://lists.yoctoproject.org=
" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> wrote:<br=
>
&gt; On 2026-08-31 14:06:28+01:00, Jose Quaresma wrote:<br>
&gt; &gt; &gt; in<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I think this should then be stated in the ccache class docum=
entation, in<br>
&gt; &gt; &gt; documentation/ref-manual/classes.rst. The host requirements =
should be kept<br>
&gt; &gt; &gt; minimal, IMO.<br>
&gt; &gt; <br>
&gt; &gt; The documentation [1] already mention the requirements for &quot;=
-native&quot;<br>
&gt; &gt; targets:<br>
&gt; &gt; <br>
&gt; &gt; ASSUME_PROVIDED +=3D &quot;ccache-native&quot;<br>
&gt; &gt; HOSTTOOLS +=3D &quot;ccache&quot;<br>
&gt; &gt; <br>
&gt; &gt; [1] <a href=3D"https://docs.yoctoproject.org/ref-manual/classes.h=
tml#ccache" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.=
org/ref-manual/classes.html#ccache</a><br>
&gt; &gt; <br>
&gt; &gt; This requirement was added last year<br>
&gt; &gt; <a href=3D"https://github.com/openembedded/openembedded-core/comm=
it/cc91a0f6500e88dd96a56307226fcfd16c60c342" rel=3D"noreferrer" target=3D"_=
blank">https://github.com/openembedded/openembedded-core/commit/cc91a0f6500=
e88dd96a56307226fcfd16c60c342</a><br>
&gt; <br>
&gt; Still, I don&#39;t think it really is a requirement, and I think the w=
ay forward is<br>
&gt; to actually remove this from ubuntu_essential.sh, fedora_essential.sh,=
<br>
&gt; <a href=3D"http://opensuse_essential_15.6.sh" rel=3D"noreferrer" targe=
t=3D"_blank">opensuse_essential_15.6.sh</a>, and <a href=3D"http://opensuse=
_essential_16.0.sh" rel=3D"noreferrer" target=3D"_blank">opensuse_essential=
_16.0.sh</a> so that all distros<br>
&gt; are aligned.<br>
&gt; <br>
&gt; If you agree, can you send a follow-up patch?<br>
<br>
I agree with this FWIW!<br></blockquote><div><br></div><div>v2 sent <a href=
=3D"https://lists.yoctoproject.org/g/docs/message/10431">https://lists.yoct=
oproject.org/g/docs/message/10431</a><br><br>Jose<br>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--000000000000f75598065a6bf8b8--

