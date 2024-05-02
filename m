Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4480C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 16:23:57 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.10251.1714667035260326120
 for <docs@lists.yoctoproject.org>;
 Thu, 02 May 2024 09:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aWCmyTcw;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-61be613d903so43251657b3.0
        for <docs@lists.yoctoproject.org>; Thu, 02 May 2024 09:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714667034; x=1715271834; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G5KtPBsTUIeqYyg/wEmoWNQitviID84dXhJTqcG+ObQ=;
        b=aWCmyTcwY3b97NNYNgYeuB+RPI1zmIRLObs7jLZk4/Rej/uhabuGkguWviLSyERajT
         B0yP7c5+rpAsUb/ECy9pyBsbkwyId4bn4Gd6f+rzlkZYdrS7eeXdw24UB2Eeg8pZB4QJ
         dkr3L3+Z9bozC4QgIPi8prj3Ep8CoI1y3VYFKF6MoWlJLxJCyxTOA441XQNHUC8UXuCA
         29qG9OJdwnS6lR9vBO90gKHp/Bu6fhbQ2uyv84vFajL91oylkIFv0kIAfwGXAIdZP6Yv
         nWuTqmWL2OyVmz5Kjyp+/e/CrNarCCx1rhx35g3zbglSgCO1n9d7VvftHUQQ9hoHirCm
         VMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714667034; x=1715271834;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5KtPBsTUIeqYyg/wEmoWNQitviID84dXhJTqcG+ObQ=;
        b=tM2f5CMo7FcIP5sISq0ooqSAu8Ej4nZte+VK2ca1HlKrzBloNOomeLD1RSLflOa7qA
         NtTlEjzSQqL6LwIAivetZHAKe0C1ZmVdubJOfly2c95JG5HiaEcxz5II/ChprU5hENYV
         jM1KgRlZw7kTXLs6N+rKIia2+wozRRHy1o8ygbbegbZxJuYBtf9iaJ5axNBJjR6F6kCL
         wqkaVE+H8JVhoDDH9SKo0UVTw32kbL6Tti/bhcbUypil3th0IObEUDibvEXE998ba6+l
         wNW4R5e0bEqc6es5kEDkhuBho7D4L6IlxI50FZx8ZF7H9RXnKZjTp320Bk2c7BMhUket
         ICdw==
X-Forwarded-Encrypted: i=1; AJvYcCWFeGbUc4v0r7EN+loMyLrlqBIhbVLg3flSC3UfrOgQUjwQkbZbb9ILmviC+U6qIs5/Xm52JkBc9GSYgGVdSxj3Q/81bhtmJ5x3l+g=
X-Gm-Message-State: AOJu0Yxar9l8IPDILfOyQU8+PPaQnJh6iqjLzUdCM5ygGrviUHTqj1NH
	xNNziLr7RSjRlwvPi8/jEdfxKYjtM0JXNv864BPfsye3U71g5rmmilfNJ/xXD9T2K0cAEZCKRD4
	4W9AHer5ltdQYlGr0xhHrhSq7ni4=
X-Google-Smtp-Source: AGHT+IEAD+7WExPaWf8b8OR2hAQwU93MivOQ0EBUb5LSJhRKaR8ubyRnv4Mccd6rO7idjDkWdJ9wTURX0fu9KMZp9ZQ=
X-Received: by 2002:a05:690c:6a06:b0:61b:97c:5ffa with SMTP id
 ih6-20020a05690c6a0600b0061b097c5ffamr7305759ywb.22.1714667034313; Thu, 02
 May 2024 09:23:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240502152701.1798568-2-tim.orling@konsulko.com>
 <CAJdd5GYyNK5qq-CKH=WHQRAZLxhJN45Nz8xYtKkO3MpYDXiBhQ@mail.gmail.com> <17CBB7F2FCD711F1.29540@lists.yoctoproject.org>
In-Reply-To: <17CBB7F2FCD711F1.29540@lists.yoctoproject.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 2 May 2024 09:23:43 -0700
Message-ID: <CANx9H-CFcVq_vqF2xwyA31K9u8Q4io1xRCyFce47Ag-OSk2yJg@mail.gmail.com>
Subject: Re: [docs] [PATCH] contributor-guide: recommend format.forceInBodyFrom
To: ticotimo@gmail.com
Cc: JPEWhacker@gmail.com, tim.orling@konsulko.com, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000007d0b3d06177b07d6"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 May 2024 16:23:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5204

--0000000000007d0b3d06177b07d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 2, 2024 at 9:12=E2=80=AFAM Tim Orling via lists.yoctoproject.or=
g
<ticotimo=3Dgmail.com@lists.yoctoproject.org> wrote:

>
>
> On Thu, May 2, 2024 at 8:38=E2=80=AFAM Joshua Watt via lists.yoctoproject=
.org
> <JPEWhacker=3Dgmail.com@lists.yoctoproject.org> wrote:
>
>> On Thu, May 2, 2024 at 9:27=E2=80=AFAM Tim Orling via lists.yoctoproject=
.org
>> <tim.orling=3Dkonsulko.com@lists.yoctoproject.org> wrote:
>> >
>> > We are seeing a lot of patches failing when the From:
>> > line is not contained in the message body. It is probably
>> > better to just recommend to force the in-body From: to be
>> > present globally.
>> >
>> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
>> > ---
>> >  documentation/contributor-guide/submit-changes.rst | 5 +++++
>> >  1 file changed, 5 insertions(+)
>> >
>> > diff --git a/documentation/contributor-guide/submit-changes.rst
>> b/documentation/contributor-guide/submit-changes.rst
>> > index 47a416b24..c292a143a 100644
>> > --- a/documentation/contributor-guide/submit-changes.rst
>> > +++ b/documentation/contributor-guide/submit-changes.rst
>> > @@ -65,6 +65,11 @@ use to identify your commits::
>> >     git config --global user.name "Ada Lovelace"
>> >     git config --global user.email "ada.lovelace@gmail.com"
>> >
>> > +To ensure that your patches are formatted properly, it is also
>> > +recommended to set::
>> > +
>> > +   git config --global format.forceInBodyFrom true
>> > +
>>
>> This is good, but we will probably need to clarify that there is a git
>> version dependency here. Git 2.34.1 (at least) doesn't have this
>> option. I'm not sure when it was added. It appears that 2.34 is the
>> version that ships with Ubuntu 22.04
>>
>
> Looks like it was introduced in 2.38.0, I think?
> https://github.com/git/git/commit/d5fc07df688ace8c5a32f66b358ebd55cdaf4d2=
8
>

I had to remind myself how I had git 2.43.2 (on Ubuntu 22.04):

$ cat /etc/apt/sources.list.d/git-core-ubuntu-ppa-jammy.list
deb https://ppa.launchpadcontent.net/git-core/ppa/ubuntu/ jammy main
# deb-src https://ppa.launchpadcontent.net/git-core/ppa/ubuntu/ jammy main


>
>
>>
>> >  Clone the Git repository for the component to modify
>> >  ----------------------------------------------------
>> >
>> > --
>> > 2.43.2
>> >
>> >
>> >
>> >
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#5202):
> https://lists.yoctoproject.org/g/docs/message/5202
> Mute This Topic: https://lists.yoctoproject.org/mt/105864996/924729
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007d0b3d06177b07d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 2, 2024 at 9:12=E2=80=AFA=
M Tim Orling via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproje=
ct.org</a> &lt;ticotimo=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.or=
g">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Thu, May 2, 2024 at 8:38=E2=80=AFAM Joshua Watt via <a href=3D"http://list=
s.yoctoproject.org" target=3D"_blank">lists.yoctoproject.org</a> &lt;JPEWha=
cker=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org" target=3D"_blank=
">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Thu, May 2, 2024 at 9:27=E2=80=AFAM Ti=
m Orling via <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" t=
arget=3D"_blank">lists.yoctoproject.org</a><br>
&lt;tim.orling=3D<a href=3D"mailto:konsulko.com@lists.yoctoproject.org" tar=
get=3D"_blank">konsulko.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt;<br>
&gt; We are seeing a lot of patches failing when the From:<br>
&gt; line is not contained in the message body. It is probably<br>
&gt; better to just recommend to force the in-body From: to be<br>
&gt; present globally.<br>
&gt;<br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 documentation/contributor-guide/submit-changes.rst | 5 +++++<br>
&gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt;<br>
&gt; diff --git a/documentation/contributor-guide/submit-changes.rst b/docu=
mentation/contributor-guide/submit-changes.rst<br>
&gt; index 47a416b24..c292a143a 100644<br>
&gt; --- a/documentation/contributor-guide/submit-changes.rst<br>
&gt; +++ b/documentation/contributor-guide/submit-changes.rst<br>
&gt; @@ -65,6 +65,11 @@ use to identify your commits::<br>
&gt;=C2=A0 =C2=A0 =C2=A0git config --global <a href=3D"http://user.name" re=
l=3D"noreferrer" target=3D"_blank">user.name</a> &quot;Ada Lovelace&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0git config --global user.email &quot;<a href=3D"mai=
lto:ada.lovelace@gmail.com" target=3D"_blank">ada.lovelace@gmail.com</a>&qu=
ot;<br>
&gt;<br>
&gt; +To ensure that your patches are formatted properly, it is also<br>
&gt; +recommended to set::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0git config --global format.forceInBodyFrom true<br>
&gt; +<br>
<br>
This is good, but we will probably need to clarify that there is a git<br>
version dependency here. Git 2.34.1 (at least) doesn&#39;t have this<br>
option. I&#39;m not sure when it was added. It appears that 2.34 is the<br>
version that ships with Ubuntu 22.04<br></blockquote><div><br></div><div>Lo=
oks like it was introduced in 2.38.0, I think?</div><div><a href=3D"https:/=
/github.com/git/git/commit/d5fc07df688ace8c5a32f66b358ebd55cdaf4d28" target=
=3D"_blank">https://github.com/git/git/commit/d5fc07df688ace8c5a32f66b358eb=
d55cdaf4d28</a></div></div></div></blockquote><div><br></div><div>I had to =
remind myself how I had git 2.43.2 (on Ubuntu 22.04):</div><div><br></div>$=
 cat /etc/apt/sources.list.d/git-core-ubuntu-ppa-jammy.list<br>deb <a href=
=3D"https://ppa.launchpadcontent.net/git-core/ppa/ubuntu/">https://ppa.laun=
chpadcontent.net/git-core/ppa/ubuntu/</a> jammy main<br><div># deb-src <a h=
ref=3D"https://ppa.launchpadcontent.net/git-core/ppa/ubuntu/">https://ppa.l=
aunchpadcontent.net/git-core/ppa/ubuntu/</a> jammy main</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div =
class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
&gt;=C2=A0 Clone the Git repository for the component to modify<br>
&gt;=C2=A0 ----------------------------------------------------<br>
&gt;<br>
&gt; --<br>
&gt; 2.43.2<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#5202): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/5202" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/5202</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/105864996/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/105864996/924729</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:ticotimo@gmail.com" target=3D"_blank">ticotimo@gmail=
.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000007d0b3d06177b07d6--

