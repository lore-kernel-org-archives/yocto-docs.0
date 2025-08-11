Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31837C87FDB
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 12:16:36 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.46687.1754914590833640439
 for <docs@lists.yoctoproject.org>;
 Mon, 11 Aug 2025 05:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IBotCI38;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-71b6ab52e8cso42143187b3.0
        for <docs@lists.yoctoproject.org>; Mon, 11 Aug 2025 05:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754914590; x=1755519390; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u4XQFF22OKrcMkqnc6Ec01jS3oc4j78Tt69NJvKkX7M=;
        b=IBotCI38fmfJIrSRuTE7sPeDhS1ojXEgGxK/1CPIGe2T0q2YKlynWJtuQ4h0G6YPrb
         z6wJU5SMEV/ntVhqDakiYgNSmbWwAhKbAQjFNckHRg0gTgLEUu/t2opKedCy9JQdQ7vi
         NVKO64tHxRvdn7pzSW1XNDStZXWkoqV5kY0VkbwUoCVI8cmy+GmaEN8qUZoHRVzJ5APM
         IwCeVvHsPDIHVyJg8nrnX5EaveQEuzqMHoOUlF4/AX/oRJrAiPG5xyuVAWSaaD/7Sn7g
         CxhNMOmeUt787GWATai73rtiaL01SqG8SAvTSYHTpB3ms28w4MQBy1Eqoe4ZlzznlFd2
         GGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754914590; x=1755519390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u4XQFF22OKrcMkqnc6Ec01jS3oc4j78Tt69NJvKkX7M=;
        b=Kd5R30TZVNLJXUYa3mV6og+rVFXM9wey5eURvcrJo/YKu+078fM4wIwcwQUePBIrGj
         rvRuqBo5H0pEU4iBehEnRhn3xgLhJiDUxUCvUK2JQMEE9zbj48zKO3tT6E/sUkDuTfnt
         cSdFhzImmSCs/O7ubdF73kxovNQxlDMkBOocKLXdGtZwKeax4ANnksBtb8k14GKhTDwb
         bau8fq2ueftST51lzvR41dEpyKVSqVGUhT1xZ17VCF9Wqxa7zUIbfghps3f+WgoywlMm
         GxpelmsWi4Tj2ICUrLsyXX6DDmVrLsadL0U1E1aXQe8Q1dDDSev5Qi1DASkAHqTBNWK2
         OBTA==
X-Forwarded-Encrypted: i=1; AJvYcCUHa/rgMrnmOXhoFZqDY3uEa6I7vE7L2HP4bm+he0HLo6vKPY3kG5pHBUcTMY39vY2x76+A@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxpLvLFhkxfDR43IraOj381WDshd7h7QQSN8baeu1kUTGJd45c6
	0BwGpSDyh46LKzaubq/KJwbICTrUxZUOxt419qp//BRfQXVMParlFEeo/aDeXcMqX5jtVycul58
	qS/SKtKz7uRAeLnEhEyhCiTIMHR0J8Uc=
X-Gm-Gg: ASbGnctxNfRa+/tqE9f1hYmTgbGZ8LF8YXnEqK24dbTeT4yZZ/JJXeIo6d/Fvb8CVbB
	5eECbpNlXNHP/O9NPxhv4YppG6itSTcLPtnJ5YC9wRQQEODs0AtQySHJ2/L2De6PtLwC2/Ygm0U
	CaE+QfKRG1vYF5nM2VreMgljmo9VPWC8AcQBtuZcpSN0fBIQSJSJLcBC5NWYTIQ+ajfTrRebb9m
	ZOKqd6q
X-Google-Smtp-Source: AGHT+IGyaalE6CVCJIDqHI55DvaEp9UmtsgDOhi3tFuq4ATDJTJGmcgFtdiHkOO/eO5VMvDHpst+9Q6D5Xny2sNit/k=
X-Received: by 2002:a05:690c:a089:10b0:71b:f500:70c0 with SMTP id
 00721157ae682-71bf5007437mr98315437b3.6.1754914589472; Mon, 11 Aug 2025
 05:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250808174828.236218-1-jan.vermaete@gmail.com>
 <CAMKF1srX4oUqvD3+X4-nf3r4ANuZ0XyyJ3UM0ea2+5fCU=Fwqw@mail.gmail.com> <CAHUKmYbRWmCZkWr-oS0EAAkqsmFLo2qqDWXMMRi1MUk0qR67aQ@mail.gmail.com>
In-Reply-To: <CAHUKmYbRWmCZkWr-oS0EAAkqsmFLo2qqDWXMMRi1MUk0qR67aQ@mail.gmail.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Mon, 11 Aug 2025 14:16:18 +0200
X-Gm-Features: Ac12FXxIQYpmqw7waqFkDfABWuW8ZE6gNMggywfv1gp9C5AvQCUQVeUxvB38Mdc
Message-ID: <CABF_=yhhsm=j2qQM_tkMkkKDurg_Rwi7sOAZQgA_HFLpBO7BFw@mail.gmail.com>
Subject: Re: [docs] [PATCH] sdk: The main in the C example should return an int
To: Etienne Cordonnier <ecordonnier@snap.com>
Cc: raj.khem@gmail.com, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000b782da063c15e48c"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 Aug 2025 12:16:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7451

--000000000000b782da063c15e48c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Could be, but the example as it is now in the document is not longer
compiling.

Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel


On Mon, 11 Aug 2025 at 13:59, Etienne Cordonnier <ecordonnier@snap.com>
wrote:

> - "return 0" is optional in main after C99, so adding it is just personal
> preference but not strictly necessary
> - int main(void) and "int main()" are fully equivalent in C23, so changin=
g
> this is also personal preference
>
> On Sat, Aug 9, 2025 at 4:48=E2=80=AFAM Khem Raj via lists.yoctoproject.or=
g
> <raj.khem=3Dgmail.com@lists.yoctoproject.org> wrote:
>
>> On Fri, Aug 8, 2025 at 10:48=E2=80=AFAM Jan Vermaete via
>> lists.yoctoproject.org <jan.vermaete=3Dgmail.com@lists.yoctoproject.org>
>> wrote:
>> >
>> > see C17 (ISO/IEC 9899:2018)
>> >
>> > Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
>> > ---
>> >  documentation/sdk-manual/working-projects.rst | 3 ++-
>> >  1 file changed, 2 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/documentation/sdk-manual/working-projects.rst
>> b/documentation/sdk-manual/working-projects.rst
>> > index 4236bcec2..7df73b1b1 100644
>> > --- a/documentation/sdk-manual/working-projects.rst
>> > +++ b/documentation/sdk-manual/working-projects.rst
>> > @@ -56,9 +56,10 @@ project:
>> >
>> >           #include <stdio.h>
>> >
>> > -         main()
>> > +         int main()
>> >               {
>> >                   printf("Hello World!\n");
>> > +                 return 0;
>> >               }
>> >
>>
>>
>> I will go a step further
>>
>> #include <stdio.h>
>>
>> int main(void) {
>>     printf("Hello World!\n");
>>     return 0;
>> }
>>
>> int main(void) explicitly states the function takes no parameters
>>
>> >     -  ``configure.ac``::
>> > --
>> > 2.39.5
>> >
>> >
>> >
>> >
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>>
> View/Reply Online (#7447):
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoprojec=
t.org_g_docs_message_7447&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DWr6Y2z0KzaAxC=
Z5tlqzjl7FhG_g1bUuEOT6AUyTYPNRZJqCnZHTFik8OoRKFmsdV&s=3DVeFiakPBZ2lD6GB4rKk=
9wgyvPjT5NnLtMkngVkCPcUY&e=3D
>> Mute This Topic:
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoprojec=
t.org_mt_114604610_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkIC=
C2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DWr6Y2z0KzaAx=
CZ5tlqzjl7FhG_g1bUuEOT6AUyTYPNRZJqCnZHTFik8OoRKFmsdV&s=3D_YRG74nRBir2XpojvN=
O2_Ql-6pOAuN6ghYEWvaWkFY4&e=3D
>> Group Owner: docs+owner@lists.yoctoproject.org
>> Unsubscribe:
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoprojec=
t.org_g_docs_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfd=
iw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DWr6Y2z0KzaAxCZ5tlqzj=
l7FhG_g1bUuEOT6AUyTYPNRZJqCnZHTFik8OoRKFmsdV&s=3DWsKidALHg4Vou-YCH1sq9unNEf=
mLi-zpe-ED9HKD7tU&e=3D
>> [ecordonnier@snap.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000b782da063c15e48c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Could be, but the example as it is now in the document is=
 not longer compiling.<br clear=3D"all"><br clear=3D"all"><div><div dir=3D"=
ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Jan Verma=
ete<br>=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary H=
amel</div></div></div><div><br></div><div><br><div class=3D"gmail_quote gma=
il_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 11 Aug 20=
25 at 13:59, Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com"=
>ecordonnier@snap.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div dir=3D"ltr">- &quot;return 0&quot; is optional in main after C99, so=
 adding it is just personal preference but not strictly necessary<br>-=C2=
=A0int main(void) and &quot;int main()&quot; are fully equivalent in C23, s=
o changing this is also personal preference</div><br><div class=3D"gmail_qu=
ote"></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Sat, Aug 9, 2025 at 4:48=E2=80=AFAM Khem Raj via <a href=3D"http://list=
s.yoctoproject.org" target=3D"_blank">lists.yoctoproject.org</a> &lt;raj.kh=
em=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org" target=3D"_blank">=
gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"></blockq=
uote></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Fri, Aug 8, 2025 at 10:48=E2=80=AFAM Jan Vermaete via<br>
<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.yoctoproject.org</a> &lt;jan.vermaete=3D<a href=3D"mailto:gmail.c=
om@lists.yoctoproject.org" target=3D"_blank">gmail.com@lists.yoctoproject.o=
rg</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; see C17 (ISO/IEC 9899:2018)<br>
&gt;<br>
&gt; Signed-off-by: Jan Vermaete &lt;<a href=3D"mailto:jan.vermaete@gmail.c=
om" target=3D"_blank">jan.vermaete@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 documentation/sdk-manual/working-projects.rst | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/documentation/sdk-manual/working-projects.rst b/documenta=
tion/sdk-manual/working-projects.rst<br>
&gt; index 4236bcec2..7df73b1b1 100644<br>
&gt; --- a/documentation/sdk-manual/working-projects.rst<br>
&gt; +++ b/documentation/sdk-manual/working-projects.rst<br>
&gt; @@ -56,9 +56,10 @@ project:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#include &lt;stdio.h&gt;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0main()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int main()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr=
intf(&quot;Hello World!\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return =
0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
<br>
<br>
I will go a step further<br>
<br>
#include &lt;stdio.h&gt;<br>
<br>
int main(void) {<br>
=C2=A0 =C2=A0 printf(&quot;Hello World!\n&quot;);<br>
=C2=A0 =C2=A0 return 0;<br>
}<br>
<br>
int main(void) explicitly states the function takes no parameters<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 ``<a href=3D"http://configure.ac" rel=3D"no=
referrer" target=3D"_blank">configure.ac</a>``::<br>
&gt; --<br>
&gt; 2.39.5<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br></blockquote></div><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
View/Reply Online (#7447): <a href=3D"https://urldefense.proofpoint.com/v2/=
url?u=3Dhttps-3A__lists.yoctoproject.org_g_docs_message_7447&amp;d=3DDwIFaQ=
&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRf=
Px_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DWr6Y2z0KzaAxCZ5tlqzjl7FhG_g1bUuEOT6AU=
yTYPNRZJqCnZHTFik8OoRKFmsdV&amp;s=3DVeFiakPBZ2lD6GB4rKk9wgyvPjT5NnLtMkngVkC=
PcUY&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proo=
fpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject.org_g_docs_message_7447&=
amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3D=
AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DWr6Y2z0KzaAxCZ5tlqzjl7F=
hG_g1bUuEOT6AUyTYPNRZJqCnZHTFik8OoRKFmsdV&amp;s=3DVeFiakPBZ2lD6GB4rKk9wgyvP=
jT5NnLtMkngVkCPcUY&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.yoctoproject.org_mt_114604610_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DWr6Y2z0KzaAxCZ5tlqzjl7FhG_g1bUuEOT6AUyTYPNRZJq=
CnZHTFik8OoRKFmsdV&amp;s=3D_YRG74nRBir2XpojvNO2_Ql-6pOAuN6ghYEWvaWkFY4&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.yoctoproject.org_mt_114604610_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DWr6Y2z0KzaAxCZ5tlqzjl7FhG_g1bUu=
EOT6AUyTYPNRZJqCnZHTFik8OoRKFmsdV&amp;s=3D_YRG74nRBir2XpojvNO2_Ql-6pOAuN6gh=
YEWvaWkFY4&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.yoctoproject.org_g_docs_unsub&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvj=
IDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkS=
Ga66m67E&amp;m=3DWr6Y2z0KzaAxCZ5tlqzjl7FhG_g1bUuEOT6AUyTYPNRZJqCnZHTFik8OoR=
KFmsdV&amp;s=3DWsKidALHg4Vou-YCH1sq9unNEfmLi-zpe-ED9HKD7tU&amp;e=3D" rel=3D=
"noreferrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=
=3Dhttps-3A__lists.yoctoproject.org_g_docs_unsub&amp;d=3DDwIFaQ&amp;c=3DncD=
TmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1=
DULJTKUkSGa66m67E&amp;m=3DWr6Y2z0KzaAxCZ5tlqzjl7FhG_g1bUuEOT6AUyTYPNRZJqCnZ=
HTFik8OoRKFmsdV&amp;s=3DWsKidALHg4Vou-YCH1sq9unNEfmLi-zpe-ED9HKD7tU&amp;e=
=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@snap.com" target=3D"_blank">ec=
ordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div></div>

--000000000000b782da063c15e48c--

