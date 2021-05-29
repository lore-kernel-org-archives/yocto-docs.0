Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web09.21209.1622297954379433808
 for <docs@lists.yoctoproject.org>;
 Sat, 29 May 2021 07:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vIHJPmbA;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: persaur@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id k4so7033359qkd.0
        for <docs@lists.yoctoproject.org>; Sat, 29 May 2021 07:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:message-id:date
         :cc:to;
        bh=DfozrkteT41K6gCtOVCvnpxgXt3opUok554wkB4hPik=;
        b=vIHJPmbA/GwYALhxIzrXVtcjvs6BUacqMakJXkXWWin2dHOiO1AFLM9x0xabdFxV6l
         cPbHQAfXWRXvyGSvZhABjMoAAWxa64gaxUldiwNvB7c8+vd1URHU/uKpsEOA9hKHDKhu
         8ceDlIdNwzeaDO/YNcfGGi9RZhd1OuYRuyjAMrmNA4S2BnfWTeO1SzRq7jJ5OpNG0Pbw
         PxAnYzSgdJYnDIasVC38QGOE/s52S8fgNGNwEAmL0rSey+zIKL/RL0gPZuvvBdW/h5xr
         DmfKxTHZjOyJuSYjyyVsIaW2Ih5ZBiy6PvvDXUMLIkHR5R5qQbzwAJVRjUUL00q1EkhP
         G7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:message-id:date:cc:to;
        bh=DfozrkteT41K6gCtOVCvnpxgXt3opUok554wkB4hPik=;
        b=jjqdqQkDCZl4h0++ofyMH4lZwTG9I+RmFHdbvkXYaYocs11mCGqlGWrHnOKz5UzZbW
         bzDSos6h8hI2gVG735mjACxtWmoXkijbgMcXhfdRYqPPXHdJ5QKtH2Por+/ZFieJYvcf
         dRMVyWw0EJH1ZVh5z5aAMujxP3vgejq++Q4woqQNrIRUEqxZYCZjX+cBLZhCUOQjfNZ3
         +oyOKjRTNK67k8UOsD3zSO+pd225pAwwTgFCEaUwfKVlp7C+ohpCdy8H4kTN1vRoZSiL
         f/SNpLWM6mYaYUF8/n5rv0AtnhnLvO+UgAwqpVsQuYPcdNPMnSMrpy5HEf8KFUhpXIlm
         5Tug==
X-Gm-Message-State: AOAM530fbAse2kAxe7BJM+UWaRhSlh1ZDD0gNSTjRwE6dd75ylJ9QKF6
	wJSo4yaVfbxMDuqlATk+53kJnKPSjQ0=
X-Google-Smtp-Source: ABdhPJxs7UzbF5ExZ3i4VkoeNFvlMz4yKHoyo2GAUbXbRq+i/mqoTJFCRLZYwjpG++aSf2v/2+1rag==
X-Received: by 2002:a05:620a:410a:: with SMTP id j10mr8685112qko.197.1622297953055;
        Sat, 29 May 2021 07:19:13 -0700 (PDT)
Return-Path: <persaur@gmail.com>
Received: from smtpclient.apple ([199.33.71.18])
        by smtp.gmail.com with ESMTPSA id y1sm5619061qkp.21.2021.05.29.07.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 May 2021 07:19:12 -0700 (PDT)
From: "Rich Persaud" <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [docs] a more focused YP FAQ?
Message-Id: <620EE90F-2EB8-4ACD-BA64-9CD98562D925@gmail.com>
Date: Sat, 29 May 2021 10:19:11 -0400
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: iPad Mail (18F72)
Content-Type: multipart/alternative; boundary=Apple-Mail-6FE384AB-E0A6-48C8-BA9A-94E8ACEF5493
Content-Transfer-Encoding: 7bit

--Apple-Mail-6FE384AB-E0A6-48C8-BA9A-94E8ACEF5493
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 29, 2021, at 09:27, Richard Purdie <richard.purdie@linuxfoundation.or=
g> wrote:
> =EF=BB=BFOn Sat, 2021-05-29 at 07:18 -0400, Robert P. J. Day wrote:
>>   i was perusing the YP ref manual FAQ and i was reminded of the
>> brilliant foreword from the subversion book by o'reilly, particularly
>> this part:
>>=20
>>=20
>> "A bad Frequently Asked Questions (FAQ) sheet is one that is composed
>> not of the questions people actually ask, but of the questions the
>> FAQ's author wishes people would ask. Perhaps you've seen the type
>> before:
>>=20
>>   Q: How can I use Glorbosoft XYZ to maximize team productivity?
>>=20
>>   A: Many of our customers want to know how they can maximize
>>      productivity through our patented office groupware innovations.
>>      The answer is simple. First, click on the File menu, scroll down
>>      to Increase Productivity, then=E2=80=A6
>>=20
>> "The problem with such FAQs is that they are not, in a literal sense,
>> FAQs at all. No one ever called the tech support line and asked, =E2=80=9C=
How
>> can we maximize productivity?=E2=80=9D Rather, people asked highly specif=
ic
>> questions, such as =E2=80=9CHow can we change the calendaring system to s=
end
>> reminders two days in advance instead of one?=E2=80=9D and so on. But it'=
s a
>> lot easier to make up imaginary Frequently Asked Questions than it is
>> to discover the real ones. Compiling a true FAQ sheet requires a
>> sustained, organized effort: over the lifetime of the software,
>> incoming questions must be tracked, responses monitored, and all
>> gathered into a coherent, searchable whole that reflects the
>> collective experience of users in the wild. It calls for the patient,
>> observant attitude of a field naturalist. No grand hypothesizing, no
>> visionary pronouncements here=E2=80=94open eyes and accurate note-taking a=
re
>> what's needed most.
>>=20
>> "What I love about this book is that it grew out of just such a
>> process, and shows it on every page. It is the direct result of the
>> authors' encounters with users. It began with Ben Collins-Sussman's
>> observation that people were asking the same basic questions over and
>> over on the Subversion mailing lists: what are the standard workflows
>> to use with Subversion? Do branches and tags work the same way as in
>> other version control systems? How can I find out who made a
>> particular change?"
>>=20
>>   some of the YP FAQ is clearly relevant, while other parts of it seem
>> to fall into the grey area described above. is it worth spending some
>> time canvassing people and collecting truly Frequently Asked
>> Questions?
>=20
> Many of the questions there have been there for a long time. Some were=20
> generated by answering questions asked by people on the irc channel.
>=20
> The trouble is the world moves on and changes and not many new ones
> have been added in a long time. We'd very much welcome new entries=20
> for there (and removal of anything which is now too old/obscure if
> appropriate).
>=20
> If anyone has the time and wants to figure out new entries, please do!
>=20
> Cheers,
>=20
> Richard

Potential starting point:

https://unix.stackexchange.com/questions/tagged/yocto?tab=3DVotes
https://stackoverflow.com/questions/tagged/yocto?tab=3DVotes

https://unix.stackexchange.com/questions/tagged/bitbake?tab=3DVotes
https://stackoverflow.com/questions/tagged/bitbake?tab=3DVotes

https://stackoverflow.com/questions/tagged/openembedded?tab=3DVotes

Rich=

--Apple-Mail-6FE384AB-E0A6-48C8-BA9A-94E8ACEF5493
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">On May 29, 2021, at 09:27,=
 Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt; wrote:<div dir=3D=
"ltr"><div dir=3D"ltr"><blockquote type=3D"cite"><br></blockquote></div><blo=
ckquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>On Sat, 2021-05-29 at 0=
7:18 -0400, Robert P. J. Day wrote:</span><br><blockquote type=3D"cite"><spa=
n>&nbsp;&nbsp;i was perusing the YP ref manual FAQ and i was reminded of the=
</span><br></blockquote><blockquote type=3D"cite"><span>brilliant foreword f=
rom the subversion book by o'reilly, particularly</span><br></blockquote><bl=
ockquote type=3D"cite"><span>this part:</span><br></blockquote><blockquote t=
ype=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span><=
/span><br></blockquote><blockquote type=3D"cite"><span>"A bad Frequently Ask=
ed Questions (FAQ) sheet is one that is composed</span><br></blockquote><blo=
ckquote type=3D"cite"><span>not of the questions people actually ask, but of=
 the questions the</span><br></blockquote><blockquote type=3D"cite"><span>FA=
Q's author wishes people would ask. Perhaps you've seen the type</span><br><=
/blockquote><blockquote type=3D"cite"><span>before:</span><br></blockquote><=
blockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"c=
ite"><span>&nbsp;&nbsp;Q: How can I use Glorbosoft XYZ to maximize team prod=
uctivity?</span><br></blockquote><blockquote type=3D"cite"><span></span><br>=
</blockquote><blockquote type=3D"cite"><span>&nbsp;&nbsp;A: Many of our cust=
omers want to know how they can maximize</span><br></blockquote><blockquote t=
ype=3D"cite"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;productivity through our pa=
tented office groupware innovations.</span><br></blockquote><blockquote type=
=3D"cite"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The answer is simple. First, c=
lick on the File menu, scroll down</span><br></blockquote><blockquote type=3D=
"cite"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to Increase Productivity, then=E2=
=80=A6</span><br></blockquote><blockquote type=3D"cite"><span></span><br></b=
lockquote><blockquote type=3D"cite"><span>"The problem with such FAQs is tha=
t they are not, in a literal sense,</span><br></blockquote><blockquote type=3D=
"cite"><span>FAQs at all. No one ever called the tech support line and asked=
, =E2=80=9CHow</span><br></blockquote><blockquote type=3D"cite"><span>can we=
 maximize productivity?=E2=80=9D Rather, people asked highly specific</span>=
<br></blockquote><blockquote type=3D"cite"><span>questions, such as =E2=80=9C=
How can we change the calendaring system to send</span><br></blockquote><blo=
ckquote type=3D"cite"><span>reminders two days in advance instead of one?=E2=
=80=9D and so on. But it's a</span><br></blockquote><blockquote type=3D"cite=
"><span>lot easier to make up imaginary Frequently Asked Questions than it i=
s</span><br></blockquote><blockquote type=3D"cite"><span>to discover the rea=
l ones. Compiling a true FAQ sheet requires a</span><br></blockquote><blockq=
uote type=3D"cite"><span>sustained, organized effort: over the lifetime of t=
he software,</span><br></blockquote><blockquote type=3D"cite"><span>incoming=
 questions must be tracked, responses monitored, and all</span><br></blockqu=
ote><blockquote type=3D"cite"><span>gathered into a coherent, searchable who=
le that reflects the</span><br></blockquote><blockquote type=3D"cite"><span>=
collective experience of users in the wild. It calls for the patient,</span>=
<br></blockquote><blockquote type=3D"cite"><span>observant attitude of a fie=
ld naturalist. No grand hypothesizing, no</span><br></blockquote><blockquote=
 type=3D"cite"><span>visionary pronouncements here=E2=80=94open eyes and acc=
urate note-taking are</span><br></blockquote><blockquote type=3D"cite"><span=
>what's needed most.</span><br></blockquote><blockquote type=3D"cite"><span>=
</span><br></blockquote><blockquote type=3D"cite"><span>"What I love about t=
his book is that it grew out of just such a</span><br></blockquote><blockquo=
te type=3D"cite"><span>process, and shows it on every page. It is the direct=
 result of the</span><br></blockquote><blockquote type=3D"cite"><span>author=
s' encounters with users. It began with Ben Collins-Sussman's</span><br></bl=
ockquote><blockquote type=3D"cite"><span>observation that people were asking=
 the same basic questions over and</span><br></blockquote><blockquote type=3D=
"cite"><span>over on the Subversion mailing lists: what are the standard wor=
kflows</span><br></blockquote><blockquote type=3D"cite"><span>to use with Su=
bversion? Do branches and tags work the same way as in</span><br></blockquot=
e><blockquote type=3D"cite"><span>other version control systems? How can I f=
ind out who made a</span><br></blockquote><blockquote type=3D"cite"><span>pa=
rticular change?"</span><br></blockquote><blockquote type=3D"cite"><span></s=
pan><br></blockquote><blockquote type=3D"cite"><span>&nbsp;&nbsp;some of the=
 YP FAQ is clearly relevant, while other parts of it seem</span><br></blockq=
uote><blockquote type=3D"cite"><span>to fall into the grey area described ab=
ove. is it worth spending some</span><br></blockquote><blockquote type=3D"ci=
te"><span>time canvassing people and collecting truly Frequently Asked</span=
><br></blockquote><blockquote type=3D"cite"><span>Questions?</span><br></blo=
ckquote><span></span><br><span>Many of the questions there have been there f=
or a long time. Some were&nbsp;</span><br><span>generated by answering quest=
ions asked by people on the irc channel.</span><br><span></span><br><span>Th=
e trouble is the world moves on and changes and not many new ones</span><br>=
<span>have been added in a long time. We'd very much welcome new entries </s=
pan><br><span>for there (and removal of anything which is now too old/obscur=
e if</span><br><span>appropriate).</span><br><span></span><br><span>If anyon=
e has the time and wants to figure out new entries, please do!</span><br><sp=
an></span><br><span>Cheers,</span><br><span></span><br><span>Richard</span><=
br></div></blockquote><br><div>Potential starting point:</div><div><br></div=
><div><a href=3D"https://unix.stackexchange.com/questions/tagged/yocto?tab=3D=
Votes">https://unix.stackexchange.com/questions/tagged/yocto?tab=3DVotes</a>=
</div><div><a href=3D"https://stackoverflow.com/questions/tagged/yocto?tab=3D=
Votes">https://stackoverflow.com/questions/tagged/yocto?tab=3DVotes</a></div=
><div><br></div><div><a href=3D"https://unix.stackexchange.com/questions/tag=
ged/bitbake?tab=3DVotes">https://unix.stackexchange.com/questions/tagged/bit=
bake?tab=3DVotes</a></div><div><a href=3D"https://stackoverflow.com/question=
s/tagged/bitbake?tab=3DVotes">https://stackoverflow.com/questions/tagged/bit=
bake?tab=3DVotes</a></div><div><br></div><div><a href=3D"https://stackoverfl=
ow.com/questions/tagged/openembedded?tab=3DVotes">https://stackoverflow.com/=
questions/tagged/openembedded?tab=3DVotes</a></div><div><br></div><div>Rich<=
/div></div></div></body></html>=

--Apple-Mail-6FE384AB-E0A6-48C8-BA9A-94E8ACEF5493--
