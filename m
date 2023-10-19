Return-Path: <persaur@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B35CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 08:23:39 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.22703.1697703811566984973
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 01:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gN8CYCC1;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: persaur@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-66cfd0b2d58so48930566d6.2;
        Thu, 19 Oct 2023 01:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697703810; x=1698308610; darn=lists.yoctoproject.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VkL/ACSSUWz+L2x3G2PtmKwdHwQbPptdMmp8radmaIg=;
        b=gN8CYCC1Q7mhF87Isjk1xxA0dUtH+JT144/D0Fxmigbn0NTebvfFyavK42SUQi7Lvh
         mia17eLrkPHBfTclZdxD/QHtpfMVy8Z8AUzm8PK3mM/laV8g3yKUrcENK/BkplrFkyoh
         qyfioD9rT6er5n5/OJC6MAMKTeuFfCZhXd5Ca7Q3EYP/2Up2CNxMSmv63CQnmagzAnzG
         L0qp1qBW47Qgy8wvbvLfh0ddobHVCA7+UH8BRfPyN6FKiYSqlWc9KLjGM2/E0Yf06T1B
         aPoq8NLMHHXiaZ0mIRt/GLGiC8K94cTPzESA0GqJF9K5MCFf72f45yvrbvhaFRsovkN+
         Gilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697703810; x=1698308610;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VkL/ACSSUWz+L2x3G2PtmKwdHwQbPptdMmp8radmaIg=;
        b=KOa11LsaZI6YUr3S9CDnjA4hzEj9LstBq7wRo7bWykrMOBPxEuDq66fDfutiNfyGBX
         VIt0ZI4Qj/oezjgWAkVFFqjbmi8y/CAI692L2T0RWP07fdwPbH+9UKnVm2dTSMuvgcty
         OwvepZ/mCGuIG9hRQ/qb8d8zChegpo4T/E/F+pyw4q9K77ulxGCYMFzQ620CVIm8bYf+
         FPiS7DlANvE3e7afU48Hbyx3oQz0pGz1UC8F9EFOmiz+It3BETzaSYEm6k5++siUde8C
         MXOYmOuxV6izbLMLRtlt+MopVmwBAttRb17LtqggLUnPLvX5lBIsWvHMLDYO5/VDtVVd
         K/rQ==
X-Gm-Message-State: AOJu0YxQBM9WRt4TgJwbf3VFy+7SbSCInR2rLM9nblW+S7cH+hxxQKcX
	VdeoLz8wz3LIxMaI7aKClFs=
X-Google-Smtp-Source: AGHT+IGGGt55uKWNx/ezCClwUixin2qy+zZTIAv8kHc8elPja0IbKa06rIgxjUkFhiI5RH0+Pne/Kg==
X-Received: by 2002:ad4:5d6a:0:b0:66c:fc2d:80a3 with SMTP id fn10-20020ad45d6a000000b0066cfc2d80a3mr1575502qvb.33.1697703810281;
        Thu, 19 Oct 2023 01:23:30 -0700 (PDT)
Received: from smtpclient.apple ([104.129.24.118])
        by smtp.gmail.com with ESMTPSA id do8-20020a056214096800b00668eb252523sm612464qvb.63.2023.10.19.01.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 01:23:29 -0700 (PDT)
Content-Type: multipart/alternative; boundary=Apple-Mail-2F45222F-615B-4359-9A35-251DC36FC741
Content-Transfer-Encoding: 7bit
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [yocto-security] [docs] Documenting YP processes
Date: Thu, 19 Oct 2023 04:23:14 -0400
Message-Id: <07126854-8A46-4370-A19A-9A3D91D77372@gmail.com>
References: <f296756f07267e29d23732acf41e7c799d7f4d22.camel@linuxfoundation.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 Marta Rybczynska <rybczynska@gmail.com>,
 YP docs mailing list <docs@lists.yoctoproject.org>,
 yocto-security@lists.yoctoproject.org
In-Reply-To: <f296756f07267e29d23732acf41e7c799d7f4d22.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: iPad Mail (20H30)
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 08:23:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4412


--Apple-Mail-2F45222F-615B-4359-9A35-251DC36FC741
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Oct 18, 2023, at 13:36, Richard Purdie <richard.purdie@linuxfoundation.or=
g> wrote:
>=20
> =EF=BB=BFOn Wed, 2023-10-18 at 16:57 +0200, Michael Opdenacker wrote:
>> Hi Marta
>>=20
>>> On 18.10.23 at 16:23, Marta Rybczynska wrote:
>>> Hello,
>>> I'm writing the "official" documentation for the YP security processes
>>> and I'm realizing that I do not know which document to put it into.
>>> There is no "YP Processes" manual. What about adding a "Security
>>> manual"? It can then include:
>>> - security processes
>>> - a single place describing how to submit CVE fixes
>>> - links to other manuals for relevant material and/or rewrites if necess=
ary
>>=20
>> IMHO, it does makes sense to create a new "Security Manual". We=20
>> currently have=20
>> https://docs.yoctoproject.org/dev-manual/vulnerabilities.html with some=20=

>> useful details contributed over time, but a separate manual would=20
>> probably get more of the attention this topic deserves.
>=20
> I'm torn between a security section in the Development Manual or a
> separate one. I don't think we want too many manuals so I have a slight
> leaning to a section but am open to persuasion.

If the goal of security-related content is to increase the production resili=
ence of Yocto-based commercial products against adversary attacks, then "sec=
urity by design" belongs in the development process, https://www.cisa.gov/ne=
ws-events/news/next-chapter-secure-design

If there are security-related processes focused on regulatory compliance, th=
ese could potentially be segregated into documentation for non-developer aud=
iences.  However, the EU, UK and US governments have drafted regulations wit=
h new compliance requirements for developers, https://www.linuxfoundation.or=
g/blog/understanding-the-cyber-resilience-act

In societies where the Rule of Law is based on Consent of The Governed, poor=
ly conceived regulations can be improved based on compliance, effectiveness o=
r lack thereof.  During periods of regulatory nondeterminism, experienced pr=
actitioners can guide future regulation by documenting sensible best practic=
es which materially improve and enforce product resilience.

Rich=

--Apple-Mail-2F45222F-615B-4359-9A35-251DC36FC741
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"></div><div dir=3D"ltr">On O=
ct 18, 2023, at 13:36, Richard Purdie &lt;richard.purdie@linuxfoundation.org=
&gt; wrote:</div><div dir=3D"ltr"><blockquote type=3D"cite"><br></blockquote=
></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>On Wed, 202=
3-10-18 at 16:57 +0200, Michael Opdenacker wrote:</span><br><blockquote type=
=3D"cite"><span>Hi Marta</span><br></blockquote><blockquote type=3D"cite"><s=
pan></span><br></blockquote><blockquote type=3D"cite"><span>On 18.10.23 at 1=
6:23, Marta Rybczynska wrote:</span><br></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><span>Hello,</span><br></blockquote></blockquot=
e><blockquote type=3D"cite"><blockquote type=3D"cite"><span>I'm writing the "=
official" documentation for the YP security processes</span><br></blockquote=
></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>and I=
'm realizing that I do not know which document to put it into.</span><br></b=
lockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span>There is no "YP Processes" manual. What about adding a "Security</span>=
<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"=
cite"><span>manual"? It can then include:</span><br></blockquote></blockquot=
e><blockquote type=3D"cite"><blockquote type=3D"cite"><span>- security proce=
sses</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span>- a single place describing how to submit CVE fixes</=
span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><span>- links to other manuals for relevant material and/or rewri=
tes if necessary</span><br></blockquote></blockquote><blockquote type=3D"cit=
e"><span></span><br></blockquote><blockquote type=3D"cite"><span>IMHO, it do=
es makes sense to create a new "Security Manual". We </span><br></blockquote=
><blockquote type=3D"cite"><span>currently have </span><br></blockquote><blo=
ckquote type=3D"cite"><span>https://docs.yoctoproject.org/dev-manual/vulnera=
bilities.html with some </span><br></blockquote><blockquote type=3D"cite"><s=
pan>useful details contributed over time, but a separate manual would </span=
><br></blockquote><blockquote type=3D"cite"><span>probably get more of the a=
ttention this topic deserves.</span><br></blockquote><span></span><br><span>=
I'm torn between a security section in the Development Manual or a</span><br=
><span>separate one. I don't think we want too many manuals so I have a slig=
ht</span><br><span>leaning to a section but am open to persuasion.</span><br=
></div></blockquote><div><br></div>If the goal of security-related content i=
s to increase the production resilience of Yocto-based commercial products a=
gainst adversary attacks, then "security by design" belongs in the developme=
nt process,&nbsp;<a href=3D"https://www.cisa.gov/news-events/news/next-chapt=
er-secure-design">https://www.cisa.gov/news-events/news/next-chapter-secure-=
design</a><div><br></div><div>If there are security-related processes focuse=
d on regulatory compliance, these could potentially be segregated into docum=
entation for non-developer audiences. &nbsp;However, the EU, UK and US gover=
nments have drafted regulations with new compliance requirements for develop=
ers,&nbsp;<a href=3D"https://www.linuxfoundation.org/blog/understanding-the-=
cyber-resilience-act">https://www.linuxfoundation.org/blog/understanding-the=
-cyber-resilience-act</a></div><div><br></div><div>In societies where the Ru=
le of Law is based on Consent of The Governed, poorly conceived regulations c=
an be improved based on compliance, effectiveness or lack thereof. &nbsp;Dur=
ing periods of regulatory nondeterminism, experienced practitioners can guid=
e future regulation by documenting sensible best practices which materially i=
mprove and enforce product resilience.<br></div><div><br></div><div>Rich</di=
v></body></html>=

--Apple-Mail-2F45222F-615B-4359-9A35-251DC36FC741--

