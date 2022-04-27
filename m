Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB62C4332F
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 11:27:48 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.6846.1651058862297980484
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 04:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JAg4clKQ;
 spf=pass (domain: linaro.org, ip: 209.85.219.174,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f174.google.com with SMTP id w187so2807121ybe.2
        for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 04:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oe5ZWSb9lkTh+LpU7FL0kjQgd/3rOoWt+ezZ0a3ldl8=;
        b=JAg4clKQUBcEGLSyTf4r9A9TCE+rJLNJ3YgbpPUE9evKWtY65j71MkIRMHhwtwVGMn
         E5qgCY6pIBnyaa/XtBbnsav4R7AZIlYBK68ChBVkeTUUTs4qVarNMPAglnHp9CnEYslW
         +WU7QY596vPiRbDdHBEUz1r8gTW+akw4FNthEqz7YTojmYx7CRw+DKvrt9nChy3sI3+O
         i0GxWwaFnIeXpt9BvFiRjAEoMd4l6Cjss0Qg2QZDctHeLQ1TYTVM+osnjp5Yw1T4zNVJ
         Pr5wzIKhJfEvr3zU0g5+aeLQWxzTPiXN6ZxDdui+R71LpUCDn2XJhy/bvjb2S7hfjT64
         T1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oe5ZWSb9lkTh+LpU7FL0kjQgd/3rOoWt+ezZ0a3ldl8=;
        b=rcxGPH/R4OGYhEMrKShs1IlfkUIn+vb+40wr0gcXNO8/YvJqed7rFRKGTQFgI4uBSm
         xVMgw7UaA17HYshtIY9ZD84zd2suqOASRN8amzJ7Gi/hHhNZbISHW5Szzetx8UT7gcnC
         Jq37LX0WV16WZvF7kSruwMoc96TC/KSZ95Sivfp6SUfzqhrbF4ncBuQZ6nwVNkc1VXLu
         nUOl5ix60hfFVnl0pAscZtg4KCLN3XNxA7ixHjxJZTuG3wYQV9zrLNgaDWR5hrUqmyk3
         d9RkZpjVA6T7XbM+Fb2jUEJWpW566L2jgdn0lDmnL87P/wF5Gu7smWCF8izkcnawKRwY
         PdfA==
X-Gm-Message-State: AOAM533/8HolA+0FJ3xpVn6g6HNVd2MLlX9eThdIMT03Nxo/oRzwg6aA
	llSY3nqryBCOA5cddD+hhxWhhRxzqHsUKIXvDGMgRQ==
X-Google-Smtp-Source: 
 ABdhPJyKDP6McuHi2wkoMSNWtuNHGha2mO37Rk8xEm4tnJQDSKvZFWdDhzBgzIoTGPYsyYWX13PDwZ7EAIaYZGnVhWk=
X-Received: by 2002:a5b:5c4:0:b0:644:dec5:53d1 with SMTP id
 w4-20020a5b05c4000000b00644dec553d1mr26215876ybp.1.1651058861354; Wed, 27 Apr
 2022 04:27:41 -0700 (PDT)
MIME-Version: 1.0
References: 
 <DM5PR1101MB236176E376BD554365050E72B9FA9@DM5PR1101MB2361.namprd11.prod.outlook.com>
 <90b05148-5215-584e-0080-24cd411b2ba8@sancloud.com>
 <CANPvuR=Sp+tuOAmFRzw207e_1+jNzOyR1AST9J=jh7_KgsOS2Q@mail.gmail.com>
 <9790963d-0e8d-c713-cc97-ab6f8ca4fef3@bootlin.com>
 <CAP71Wjw=OL8e=EqgPaLfPbQisTeFuVE2FkXq7+M9nWKckK4Y_Q@mail.gmail.com>
In-Reply-To: 
 <CAP71Wjw=OL8e=EqgPaLfPbQisTeFuVE2FkXq7+M9nWKckK4Y_Q@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 27 Apr 2022 13:27:30 +0200
Message-ID: 
 <CAP71WjwG2PCT=ceuZpBmeF-Xzn9yVQi1PG2+d6+wRjouoAZ0Aw@mail.gmail.com>
Subject: Re: [docs] [yocto] [ANNOUNCEMENT] Yocto Project 4.0 is Released
To: michael.opdenacker@bootlin.com
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
 Paul Barker <paul.barker@sancloud.com>,
	"Lee, Chee Yang" <chee.yang.lee@intel.com>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000ef454705dda11837"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Apr 2022 11:27:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2884

--000000000000ef454705dda11837
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 27, 2022 at 1:17 PM Nicolas Dechesne <
nicolas.dechesne@linaro.org> wrote:

>
>
> On Wed, Apr 27, 2022 at 10:59 AM Michael Opdenacker via
> lists.yoctoproject.org <michael.opdenacker=
> bootlin.com@lists.yoctoproject.org> wrote:
>
>>
>> On 4/27/22 10:18, Jose Quaresma wrote:
>> >
>> >
>> > In the HTML page it is fine, the &YOCTO_DOC_VERSION is 4.0
>> >
>> https://docs.yoctoproject.org/4.0/migration-guides/migration-4.0.html#release-notes-for-4-0-kirkstone
>> >
>> > In the dev version the &YOCTO_DOC_VERSION is not replaced by dev
>> >
>> https://docs.yoctoproject.org/dev/migration-guides/migration-4.0.html#release-notes-for-4-0-kirkstone
>>
>>
>> That's *very weird* because the substitution happened in
>> https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/index.html but
>> not in
>>
>> https://docs.yoctoproject.org/dev/migration-guides/migration-4.0.html#release-notes-for-4-0-kirkstone
>> (same version).
>>
>> When I build the docs locally things look fine. Any ideas what could
>> cause this?
>>
>
> I can reproduce the issue when building locally. I am using Sphinx==4.4.0
>

oh... It's because the file release-notes-4.0.rst is included with a
..include statement. The variable mapping is done with a custom Sphinx
extension (yocto-vars.py) which is triggered for the 'source-read' event.
So perhaps this event is not triggered when using an include statement..
let me check more on that..

>
>
>>
>> Michael.
>>
>> --
>> Michael Opdenacker, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#2876):
>> https://lists.yoctoproject.org/g/docs/message/2876
>> Mute This Topic: https://lists.yoctoproject.org/mt/90726109/1279857
>> Group Owner: docs+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
>> nicolas.dechesne@linaro.org]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>

--000000000000ef454705dda11837
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 27, 2022 at 1:17 PM Nicol=
as Dechesne &lt;<a href=3D"mailto:nicolas.dechesne@linaro.org">nicolas.dech=
esne@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 27, 2022=
 at 10:59 AM Michael Opdenacker via <a href=3D"http://lists.yoctoproject.or=
g" target=3D"_blank">lists.yoctoproject.org</a> &lt;michael.opdenacker=3D<a=
 href=3D"mailto:bootlin.com@lists.yoctoproject.org" target=3D"_blank">bootl=
in.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><br>
On 4/27/22 10:18, Jose Quaresma wrote:<br>
&gt;<br>
&gt; =C2=A0<br>
&gt; In the HTML page it is fine, the &amp;YOCTO_DOC_VERSION is 4.0<br>
&gt; <a href=3D"https://docs.yoctoproject.org/4.0/migration-guides/migratio=
n-4.0.html#release-notes-for-4-0-kirkstone" rel=3D"noreferrer" target=3D"_b=
lank">https://docs.yoctoproject.org/4.0/migration-guides/migration-4.0.html=
#release-notes-for-4-0-kirkstone</a><br>
&gt;<br>
&gt; In the dev version the &amp;YOCTO_DOC_VERSION is not replaced by dev<b=
r>
&gt; <a href=3D"https://docs.yoctoproject.org/dev/migration-guides/migratio=
n-4.0.html#release-notes-for-4-0-kirkstone" rel=3D"noreferrer" target=3D"_b=
lank">https://docs.yoctoproject.org/dev/migration-guides/migration-4.0.html=
#release-notes-for-4-0-kirkstone</a><br>
<br>
<br>
That&#39;s *very weird* because the substitution happened in<br>
<a href=3D"https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/index.htm=
l" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.org/dev/b=
rief-yoctoprojectqs/index.html</a> but<br>
not in<br>
<a href=3D"https://docs.yoctoproject.org/dev/migration-guides/migration-4.0=
.html#release-notes-for-4-0-kirkstone" rel=3D"noreferrer" target=3D"_blank"=
>https://docs.yoctoproject.org/dev/migration-guides/migration-4.0.html#rele=
ase-notes-for-4-0-kirkstone</a><br>
(same version).<br>
<br>
When I build the docs locally things look fine. Any ideas what could<br>
cause this?<br></blockquote><div><br></div><div>I can reproduce the issue w=
hen building locally. I am using Sphinx=3D=3D4.4.0</div></div></div></block=
quote><div><br></div><div>oh... It&#39;s because the file release-notes-4.0=
.rst is included with a ..include statement. The variable mapping is done w=
ith a custom Sphinx extension (yocto-vars.py) which is triggered for the &#=
39;source-read&#39; event. So perhaps this event is not triggered when usin=
g an include statement.. let me check more on that..=C2=A0=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D=
"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#2876): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/2876" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/2876</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/90726109/1279=
857" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/90726109/1279857</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicol=
as.dechesne@linaro.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000ef454705dda11837--

