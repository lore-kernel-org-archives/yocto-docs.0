Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A101C433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 10:38:29 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web11.24044.1639478307105116129
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 02:38:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SABz5NmX;
 spf=pass (domain: gmail.com, ip: 209.85.222.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id ay21so34004234uab.12
        for <docs@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 02:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/pU/BBIG6yeDveeAhzws5frK1HhfmnT4UsDoJpl/Fl8=;
        b=SABz5NmX+lLzDHHW6cFx2WqR87+TeESsF6Kp+lBc+fmcdrYJ/bPvjiL600Rd7+SHHv
         E1rEvk+xcKd4HEehIJ4QScTmypBq2YDzzTMCA4ZvgGYDdRTVAacKWqFqMWrI6s63EXMH
         S9rm0W2uo7y3KCfjnBB9600B96b+ruz9Kwz/KmIcjsEbfCXCUtDdXfwchzgHEJGN2V7D
         Ja3emevRwSqowKCKIC55XkPY847vn4GuJsRPEL7CoHAuhD9YIGIpAahetulPttg9r+dE
         9nyjnrHWNNX1FiGyMB0rxrfGlj24bfQwbDe2uB8VQavjzmIYGvChp9z7IMQ7rLrWDpOt
         7Kog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/pU/BBIG6yeDveeAhzws5frK1HhfmnT4UsDoJpl/Fl8=;
        b=y9Hdn1tH058mMF2mYtr+oHrGN4VL68PaQejjC89XqE7/rV7mfvJk1tv8zJ7VBmzIlz
         CKCXwlyL/KwIKBN6ZAKbVqmAbziq+QfpMOWJRqZtjzserMVxvlNOvsIeoV6euiVyBBas
         TK4fEeZjR3HOSSN1Xb/o2lAOcFPKry0Ngf5ll2kQguiiruVcB9OJCgRvUqkzIHaS4MYV
         tZHS7ZNUQpNuNDo937cqSV5cWujTqI59CE6sKNmvDUHXGeuyiZblcsKOS97v7jmh9ttr
         KV4o5SpoTzHFNiro47V88Dh3pYIT1+Gq8b6sHwMK89uRPv2tqBthp6CBihfATsu45K0g
         lOBA==
X-Gm-Message-State: AOAM531Dk1Q50VN9QdRIsKp0age8LKo0MnN/rSlqU0xwMThfB3obHB5C
	gjYyQY28pyB7j22GmNAmKHuaJ4wnycAU1LhGtV8=
X-Google-Smtp-Source: 
 ABdhPJxP87PHvQppkrlbvphr7UJxhpPjyLumChkhVL99ZY8KPQl/ZkcBaHDjVMf1xmnaTpZNe3zo2Ypkd0+LRfHvDZo=
X-Received: by 2002:a05:6102:3232:: with SMTP id
 x18mr3971965vsf.38.1639478306184;
 Tue, 14 Dec 2021 02:38:26 -0800 (PST)
MIME-Version: 1.0
References: 
 <CANNYZj-jYhoRu8S6C=CmhiP7L+zgdG97fj4MmRQ-wRco2xWxZQ@mail.gmail.com>
 <AM9PR09MB46424D01CC5A6F489074FA04A8709@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <ce0b166097c52942fefb8b93849ebff88a1e1ca9.camel@linuxfoundation.org>
 <1822eb65-af18-f149-7a6f-6f985bc6e72c@bootlin.com>
In-Reply-To: <1822eb65-af18-f149-7a6f-6f985bc6e72c@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Dec 2021 11:38:14 +0100
Message-ID: 
 <CANNYZj-_Uke6GqZwqziTdA48tWGwHvw=Wm_BGjvJKaS+5oqjQA@mail.gmail.com>
Subject: Re: [docs] [Openembedded-architecture] proposal: allow
 Upstream-Status: Inactive-Upstream in patches
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>,
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000000ea25b05d318ca29"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Dec 2021 10:38:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2252

--0000000000000ea25b05d318ca29
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Dec 2021 at 11:30, Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Are you suggesting to expand the official Yocto Project docs on this topic?
> Actually, I only see
> https://docs.yoctoproject.org/dev-manual/common-tasks.html#patching-code
> which explains the use of patches. There is much more content indeed in
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>

I would suggest you link to the wiki, but please do not copy any content,
as it will certainly become mismatched.

Alex

--0000000000000ea25b05d318ca29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 14 Dec 2021 at 11:30, Michael Opdenacker &lt;<a href=3D"mail=
to:michael.opdenacker@bootlin.com">michael.opdenacker@bootlin.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Are you su=
ggesting to expand the official Yocto Project docs on this topic?<br>
Actually, I only see<br>
<a href=3D"https://docs.yoctoproject.org/dev-manual/common-tasks.html#patch=
ing-code" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.or=
g/dev-manual/common-tasks.html#patching-code</a><br>
which explains the use of patches. There is much more content indeed in<br>
<a href=3D"https://www.openembedded.org/wiki/Commit_Patch_Message_Guideline=
s" rel=3D"noreferrer" target=3D"_blank">https://www.openembedded.org/wiki/C=
ommit_Patch_Message_Guidelines</a><br></blockquote><div><br></div><div>I wo=
uld suggest you link to the wiki, but please do not copy any content, as it=
 will certainly become mismatched.</div><div><br></div><div>Alex<br></div><=
/div></div>

--0000000000000ea25b05d318ca29--

