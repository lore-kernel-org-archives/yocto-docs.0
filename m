Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF6AC433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 17:31:58 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web09.282.1636738316925266031
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 09:31:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XDq2JFJf;
 spf=pass (domain: gmail.com, ip: 209.85.222.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id l43so20369109uad.4
        for <docs@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 09:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S6ChPa7Mf9PqRMU0Iyh2kMB5dexwrf4PhZAyNgHlubg=;
        b=XDq2JFJfrJAPwNfk/hSXZdvaVog9/CxUKQd4pPYkmeOyvWsxZoyKdJ0sGf5+rFbScw
         PMOOHMsf7qwVdxoU6s1Kdf38/Vl67bIhPTmjgZbFFNdOpk7EUms/P3Pd+Z2SL3ahv84U
         8EiAw+rseHTmXZAbUXkbeq7df+d21MswHpPlFVyTq/X2qskd5YjUg324OBZAXjym7GlW
         IIEu1UDs+Mc36keVDmlZtVFgxl2V9Ee/9be+ZzruordGNW9b4CDsPmrEZY+NBJH4uhnW
         B0/1a9qO4AALEelryOHLjHK6FtPoK7i/PK8C2DKa4XJ5jquozgoY6QcnNdXxcBE1NX0h
         A+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S6ChPa7Mf9PqRMU0Iyh2kMB5dexwrf4PhZAyNgHlubg=;
        b=xSdyLXuvzpT4z4UlD+zFkmwSn6FHpbrWXzfe1X725V649tH0meWJGrIPuOb5dkCVs0
         GLz+0ZjHrsr1AvxDwpShdo1cfz7h5jr/6SPPnPpOAh4kDpeE61h5RezwCNYjpxv4zuCb
         WbvXcroH3OLbWJme1meozFfPqYKBD9nc58tOmXnrBLOWZexWHJuY4fMetLQ5Fdp+NnTW
         FGEFG/oJAfRPNEqROsv+rcFzrFny7I35j9suzGsjceiArBIIUS2OryNRcK4mTalekO2i
         iK1Ek2AGPVlkkzoVYjVOPUNn8nlSPLIOlHng9tcSaR0RCU3BD3uCra/TGdbzmC2ReiCc
         BK2Q==
X-Gm-Message-State: AOAM532EDv3VF0e7c/uRBvgA1nWm8two86XnrC529wrn57eYfq7keZap
	/x3zU1sgc6ZZ21xeGw3hLhnX0tu3zlgrm5vC3C65+i5c
X-Google-Smtp-Source: 
 ABdhPJwCHoUzJSfBI7LVXx4ZiNhdsNiRTvCFNcOK+HVfQVLClad5z091N7W+RDb8cUP7F+0alfsU0qhgvSyIIyxUigs=
X-Received: by 2002:ab0:1e04:: with SMTP id m4mr20900255uak.100.1636738314737;
 Fri, 12 Nov 2021 09:31:54 -0800 (PST)
MIME-Version: 1.0
References: <84ac62a4-4e20-5453-47eb-994be2e11511@bootlin.com>
 <CANNYZj9EJ7UsrkCY0zOjYMc0DPYsqq5Z9ogOy68vU_x3GmRxtA@mail.gmail.com>
 <1d0977eb-4377-a3a7-e194-c0c257d3785e@bootlin.com>
 <16B6DC9FC67D1267.31620@lists.yoctoproject.org>
In-Reply-To: <16B6DC9FC67D1267.31620@lists.yoctoproject.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 12 Nov 2021 18:31:43 +0100
Message-ID: 
 <CANNYZj_KrdOYsSC2xj+-BFjWURtk-hFBQS1Fw8rfW4ob4=MxOw@mail.gmail.com>
Subject: Re: [docs] Why "git send-email -M -1" in our contributing
 instructions?
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000d71db305d09ad59f"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Nov 2021 17:31:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2147

--000000000000d71db305d09ad59f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

-M shouldn't be dropped either, as without it there might not be rename
detection at all, depending on local configuration.

Alex

On Fri, 12 Nov 2021 at 18:28, Alexander Kanavin via lists.yoctoproject.org
<alex.kanavin=3Dgmail.com@lists.yoctoproject.org> wrote:

> No. You need to specify what commit(s) you want to sent, '-1' means 'one
> latest commit'. And that in itself won't send things twice, there's
> something else in your local setup.
>
> Alex
>
> On Fri, 12 Nov 2021 at 18:17, Michael Opdenacker <
> michael.opdenacker@bootlin.com> wrote:
>
>> Hi Alex,
>>
>> On 11/12/21 5:57 PM, Alexander Kanavin wrote:
>> > git send-email inherits all options from git format-patch. Yes it's
>> > annoying.
>>
>>
>> Got it, I missed this sentence in git send-email's documentation: "any
>> format accepted by git-format-patch[1]
>> <https://git-scm.com/docs/git-format-patch> can be passed to git
>> send-email."
>>
>> >
>> >        -M[<n>], --find-renames[=3D<n>]
>> >            Detect renames. If n is specified, it is a threshold on the
>> > similarity index (i.e. amount of addition/deletions compared to the
>> > file=E2=80=99s size). For example, -M90% means Git should consider a
>> > delete/add pair to be a rename
>> >            if more than 90% of the file hasn=E2=80=99t changed. Withou=
t a %
>> > sign, the number is to be read as a fraction, with a decimal point
>> > before it. I.e., -M5 becomes 0.5, and is thus the same as -M50%.
>> > Similarly, -M05 is the same as
>> >            -M5%. To limit detection to exact renames, use -M100%. The
>> > default similarity index is 50%.
>>
>>
>> Actually, I found that "-1" alone (with or without "-M" before) was
>> causing the e-mail to be sent twice. So, if "-1" doesn't apply to "-M",
>> then we probably have the default value for the -M option, and
>> therefore, we could do without "-M" entirely, couldn't we?
>>
>> At least, we could drop "-1" from our contributing instructions, right?
>>
>> Thanks for your help!
>>
>> Michael.
>>
>> --
>>
>> Michael Opdenacker, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2146):
> https://lists.yoctoproject.org/g/docs/message/2146
> Mute This Topic: https://lists.yoctoproject.org/mt/87010850/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d71db305d09ad59f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>-M shouldn&#39;t be dropped either, as without it the=
re might not be rename detection at all, depending on local configuration.<=
/div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 12 Nov 2021 at 18:28, Alexan=
der Kanavin via <a href=3D"http://lists.yoctoproject.org">lists.yoctoprojec=
t.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.yoctoproject=
.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>No. You need to=
 specify what commit(s) you want to sent, &#39;-1&#39; means &#39;one lates=
t commit&#39;. And that in itself won&#39;t send things twice, there&#39;s =
something else in your local setup.<br></div><div><br></div><div>Alex<br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Fri, 12 Nov 2021 at 18:17, Michael Opdenacker &lt;<a href=3D"mailto:=
michael.opdenacker@bootlin.com" target=3D"_blank">michael.opdenacker@bootli=
n.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Hi Alex,<br>
<br>
On 11/12/21 5:57 PM, Alexander Kanavin wrote:<br>
&gt; git send-email inherits all options from git format-patch. Yes it&#39;=
s<br>
&gt; annoying.<br>
<br>
<br>
Got it, I missed this sentence in git send-email&#39;s documentation: &quot=
;any<br>
format accepted by git-format-patch[1]<br>
&lt;<a href=3D"https://git-scm.com/docs/git-format-patch" rel=3D"noreferrer=
" target=3D"_blank">https://git-scm.com/docs/git-format-patch</a>&gt; can b=
e passed to git<br>
send-email.&quot;<br>
<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0=C2=A0 -M[&lt;n&gt;], --find-renames[=3D&lt;n&gt;]=
<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Detect renames. If n is speci=
fied, it is a threshold on the<br>
&gt; similarity index (i.e. amount of addition/deletions compared to the<br=
>
&gt; file=E2=80=99s size). For example, -M90% means Git should consider a<b=
r>
&gt; delete/add pair to be a rename<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if more than 90% of the file =
hasn=E2=80=99t changed. Without a %<br>
&gt; sign, the number is to be read as a fraction, with a decimal point<br>
&gt; before it. I.e., -M5 becomes 0.5, and is thus the same as -M50%.<br>
&gt; Similarly, -M05 is the same as<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-M5%. To limit detection to e=
xact renames, use -M100%. The<br>
&gt; default similarity index is 50%.<br>
<br>
<br>
Actually, I found that &quot;-1&quot; alone (with or without &quot;-M&quot;=
 before) was<br>
causing the e-mail to be sent twice. So, if &quot;-1&quot; doesn&#39;t appl=
y to &quot;-M&quot;,<br>
then we probably have the default value for the -M option, and<br>
therefore, we could do without &quot;-M&quot; entirely, couldn&#39;t we?<br=
>
<br>
At least, we could drop &quot;-1&quot; from our contributing instructions, =
right?<br>
<br>
Thanks for your help!<br>
<br>
Michael.<br>
<br>
-- <br>
<br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#2146): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/2146" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/2146</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/87010850/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/87010850/1686489</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000d71db305d09ad59f--

