Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D48C87FDB
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 12:43:56 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.47180.1754916231972524456
 for <docs@lists.yoctoproject.org>;
 Mon, 11 Aug 2025 05:43:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=GoYpe/05;
 spf=pass (domain: snapchat.com, ip: 209.85.208.43, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6154655c8aeso6018340a12.3
        for <docs@lists.yoctoproject.org>; Mon, 11 Aug 2025 05:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1754916230; x=1755521030; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HJa6xCNRywNmMSTV3UYcj4K+aMtc6IJeL0ywnTyf8nw=;
        b=GoYpe/05TbzglCrnOSqj/KKTUVWDXPYKkWsTOxKmH8JK1UN+MNjSFNVYTGpUXyubew
         sGDMjPdb7o8Txg6mFTRlfLpAZ7S3z9LN+M9S5wAKEctcUGmQP61jlxyK7PT40VS22B0C
         ZwRzEvrfez3TqFoDaMTULw9LUswKrAn/wsXw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754916230; x=1755521030;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJa6xCNRywNmMSTV3UYcj4K+aMtc6IJeL0ywnTyf8nw=;
        b=dCiTK+2QhGT05QHWbtDEFiSg6aTQcfWQkLssU1sOgPBthc/GGQWtIkkDPxXIkhhNVx
         Y8u5K1iC2I5M6+qrQc+pcR+doH5Q6g1Ix0eQxPt4o8vZguWJJruzd8Hf/rmYbF9elJJ2
         oa8FihMjIZJ1NHSe1Keny1JlPv4UXLj4e951KDId1OA+cpTyroifjMxFy5kEyjZNiuZJ
         paTggv0x5RAKO5a2LKdZx3drLwyBnDEd2eoGvioPpt/7I18+0u8agnmYfLELVcpl/lvN
         bfu14FX2zHl+SuikL/WHqgxfBtBFkX8XSata8JCtkBWcSZzdl9Kb5tshUjOyEpYemjha
         U+/w==
X-Forwarded-Encrypted: i=1; AJvYcCWycC2ULBJjWj+u+D3KXn4lzX0qqcS+JHmTIOWSmCtKz82cV0OzC/NAIz9qSsU7NfinaNfj@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzYz0dGJKxOmml5/n712A8ke4XqkllUezZ+8nmktYuxR2h5Hsay
	TkyKOUnyIrxRjnpgWRSD+BqlABC3VjKL6nvuErzLOsHFYkonS6vn2Bo6t9AtZJVGlngrzalORDy
	4FyY0qIZZG4NAhWFQic28gzEHQKE2Jdt4N8cP+YgMtA==
X-Gm-Gg: ASbGncsYr2lvnyYzUfcZHKBGXFF1zRwvZ5nNNTd5VKL7P7X9/8erpOrZQcy7DBTwdUd
	8iIP+cCkOG4nueNA7R0uxunG9zzsf+48Lep1hNsQgm7gASWDxjK0L8+fqABAzNHj3OZx9jhJz9z
	diaY2kNCDJLudLLuE6HVrutbNhGVwiXIU/KelJPLB4Bfg/754TYqY+VCCFz0vcLLaBiXVK1mGnx
	DRvpP0=
X-Google-Smtp-Source: AGHT+IGZERBpqxMD2xL+ktAgk++Syi63Ooh+lhYWPh5oAlj0zGPaIRWt2cv2MUhVec0MidcgpkFgxau8XKOyQ9QvXlM=
X-Received: by 2002:a17:907:3d4c:b0:ae0:ad8c:a559 with SMTP id
 a640c23a62f3a-af9c640e351mr1337149966b.4.1754916230268; Mon, 11 Aug 2025
 05:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250808174828.236218-1-jan.vermaete@gmail.com>
 <CAMKF1srX4oUqvD3+X4-nf3r4ANuZ0XyyJ3UM0ea2+5fCU=Fwqw@mail.gmail.com>
 <CAHUKmYbRWmCZkWr-oS0EAAkqsmFLo2qqDWXMMRi1MUk0qR67aQ@mail.gmail.com> <CABF_=yhhsm=j2qQM_tkMkkKDurg_Rwi7sOAZQgA_HFLpBO7BFw@mail.gmail.com>
In-Reply-To: <CABF_=yhhsm=j2qQM_tkMkkKDurg_Rwi7sOAZQgA_HFLpBO7BFw@mail.gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 11 Aug 2025 14:43:39 +0200
X-Gm-Features: Ac12FXxbZ3-4cbGYO2LXkZzCNlocf6j0N3-hOW5ApOsPq5-7DvPQ1xrnleXgbJ4
Message-ID: <CAHUKmYbwek+5wWO1GaoM4us-CryArB+FHdB06a6nH=VD2ra2nA@mail.gmail.com>
Subject: Re: [docs] [PATCH] sdk: The main in the C example should return an int
To: jan vermaete <jan.vermaete@gmail.com>
Cc: raj.khem@gmail.com, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000084335a063c164603"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 Aug 2025 12:43:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7452

--00000000000084335a063c164603
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

"Could be, but the example as it is now in the document is not longer
compiling."

-> not because of a missing "return 0" or a lack of void keyword in main,
so I don't know why you mention this. I agree that adding int as return
type is necessary: "int main()", the other changes can be added, but is
purely based on personal preference and not needed to fix the build. IMO
"int main()" is better than "int main(void)", which is why this was changed
in C23.

On Mon, Aug 11, 2025 at 2:16=E2=80=AFPM jan vermaete <jan.vermaete@gmail.co=
m> wrote:

> Could be, but the example as it is now in the document is not longer
> compiling.
>
> Jan Vermaete
> =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel
>
>
> On Mon, 11 Aug 2025 at 13:59, Etienne Cordonnier <ecordonnier@snap.com>
> wrote:
>
>> - "return 0" is optional in main after C99, so adding it is just persona=
l
>> preference but not strictly necessary
>> - int main(void) and "int main()" are fully equivalent in C23, so
>> changing this is also personal preference
>>
>> On Sat, Aug 9, 2025 at 4:48=E2=80=AFAM Khem Raj via lists.yoctoproject.o=
rg
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.yoctoprojec=
t.org&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNo=
nVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Df-tqaJMvLQZsto9LmB4OqePZ_OjDN3dti=
7PPJVlvEhjKheIUAUdL0o3fi3YkQ4tk&s=3D3ohM9rWyyPHVETHCYT9vX7yeUFDmw-5TRFHoFHI=
PcO4&e=3D>
>> <raj.khem=3Dgmail.com@lists.yoctoproject.org> wrote:
>>
>>> On Fri, Aug 8, 2025 at 10:48=E2=80=AFAM Jan Vermaete via
>>> lists.yoctoproject.org
>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.yoctoproje=
ct.org&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbN=
onVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Df-tqaJMvLQZsto9LmB4OqePZ_OjDN3dt=
i7PPJVlvEhjKheIUAUdL0o3fi3YkQ4tk&s=3D3ohM9rWyyPHVETHCYT9vX7yeUFDmw-5TRFHoFH=
IPcO4&e=3D>
>>> <jan.vermaete=3Dgmail.com@lists.yoctoproject.org>
>>> wrote:
>>> >
>>> > see C17 (ISO/IEC 9899:2018)
>>> >
>>> > Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
>>> > ---
>>> >  documentation/sdk-manual/working-projects.rst | 3 ++-
>>> >  1 file changed, 2 insertions(+), 1 deletion(-)
>>> >
>>> > diff --git a/documentation/sdk-manual/working-projects.rst
>>> b/documentation/sdk-manual/working-projects.rst
>>> > index 4236bcec2..7df73b1b1 100644
>>> > --- a/documentation/sdk-manual/working-projects.rst
>>> > +++ b/documentation/sdk-manual/working-projects.rst
>>> > @@ -56,9 +56,10 @@ project:
>>> >
>>> >           #include <stdio.h>
>>> >
>>> > -         main()
>>> > +         int main()
>>> >               {
>>> >                   printf("Hello World!\n");
>>> > +                 return 0;
>>> >               }
>>> >
>>>
>>>
>>> I will go a step further
>>>
>>> #include <stdio.h>
>>>
>>> int main(void) {
>>>     printf("Hello World!\n");
>>>     return 0;
>>> }
>>>
>>> int main(void) explicitly states the function takes no parameters
>>>
>>> >     -  ``configure.ac
>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__configure.ac&d=
=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Df-tqaJMvLQZsto9LmB4OqePZ_OjDN3dti7PPJVlv=
EhjKheIUAUdL0o3fi3YkQ4tk&s=3Dj2m9TmXi_dMLEfSZID4zMoJqhFaWviDSvxcmjsPHbDE&e=
=3D>
>>> ``::
>>> > --
>>> > 2.39.5
>>> >
>>> >
>>> >
>>> >
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>>
>> View/Reply Online (#7447):
>>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproje=
ct.org_g_docs_message_7447&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkIC=
C2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DWr6Y2z0KzaAx=
CZ5tlqzjl7FhG_g1bUuEOT6AUyTYPNRZJqCnZHTFik8OoRKFmsdV&s=3DVeFiakPBZ2lD6GB4rK=
k9wgyvPjT5NnLtMkngVkCPcUY&e=3D
>>> Mute This Topic:
>>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproje=
ct.org_mt_114604610_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkI=
CC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DWr6Y2z0KzaA=
xCZ5tlqzjl7FhG_g1bUuEOT6AUyTYPNRZJqCnZHTFik8OoRKFmsdV&s=3D_YRG74nRBir2Xpojv=
NO2_Ql-6pOAuN6ghYEWvaWkFY4&e=3D
>>> Group Owner: docs+owner@lists.yoctoproject.org
>>> Unsubscribe:
>>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproje=
ct.org_g_docs_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckf=
diw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DWr6Y2z0KzaAxCZ5tlqz=
jl7FhG_g1bUuEOT6AUyTYPNRZJqCnZHTFik8OoRKFmsdV&s=3DWsKidALHg4Vou-YCH1sq9unNE=
fmLi-zpe-ED9HKD7tU&e=3D
>>> [ecordonnier@snap.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>

--00000000000084335a063c164603
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&quot;Could be, but the example as it is now in the docume=
nt is not longer compiling.&quot;<br><br>-&gt; not because of a missing &qu=
ot;return 0&quot; or a lack of void keyword in main, so I don&#39;t know wh=
y you mention this. I agree that adding int as return type is necessary: &q=
uot;int main()&quot;, the other changes can be added, but is purely based o=
n personal preference and not needed to fix the build. IMO &quot;int main()=
&quot; is better than &quot;int main(void)&quot;, which is why this was cha=
nged in C23.</div><br><div class=3D"gmail_quote gmail_quote_container"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 11, 2025 at 2:16=E2=80=AFPM j=
an vermaete &lt;<a href=3D"mailto:jan.vermaete@gmail.com">jan.vermaete@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"auto">Could be, but the example as it is now in the docume=
nt is not longer compiling.<br clear=3D"all"><br clear=3D"all"><div><div di=
r=3D"ltr" class=3D"gmail_signature">Jan Vermaete<br>=E2=80=9CSuccess is a s=
elf-correcting phenomenom.=E2=80=9D -- Gary Hamel</div></div></div><div><br=
></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Mon, 11 Aug 2025 at 13:59, Etienne Cordonnier &lt;<a href=3D"mailt=
o:ecordonnier@snap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr">- &quot;return 0&quot; is optional in main after C99, so adding it is j=
ust personal preference but not strictly necessary<br>-=C2=A0int main(void)=
 and &quot;int main()&quot; are fully equivalent in C23, so changing this i=
s also personal preference</div><br><div class=3D"gmail_quote"></div><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 9, 2=
025 at 4:48=E2=80=AFAM Khem Raj via <a href=3D"https://urldefense.proofpoin=
t.com/v2/url?u=3Dhttp-3A__lists.yoctoproject.org&amp;d=3DDwMFaQ&amp;c=3DncD=
TmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1=
DULJTKUkSGa66m67E&amp;m=3Df-tqaJMvLQZsto9LmB4OqePZ_OjDN3dti7PPJVlvEhjKheIUA=
UdL0o3fi3YkQ4tk&amp;s=3D3ohM9rWyyPHVETHCYT9vX7yeUFDmw-5TRFHoFHIPcO4&amp;e=
=3D" target=3D"_blank">lists.yoctoproject.org</a> &lt;raj.khem=3D<a href=3D=
"mailto:gmail.com@lists.yoctoproject.org" target=3D"_blank">gmail.com@lists=
.yoctoproject.org</a>&gt; wrote:<br></div></div><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"></blockquote></div><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On F=
ri, Aug 8, 2025 at 10:48=E2=80=AFAM Jan Vermaete via<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.yoct=
oproject.org&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epck=
fdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Df-tqaJMvLQ=
Zsto9LmB4OqePZ_OjDN3dti7PPJVlvEhjKheIUAUdL0o3fi3YkQ4tk&amp;s=3D3ohM9rWyyPHV=
ETHCYT9vX7yeUFDmw-5TRFHoFHIPcO4&amp;e=3D" rel=3D"noreferrer" target=3D"_bla=
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
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 ``<a href=3D"https://urldefense.proofpoint.=
com/v2/url?u=3Dhttp-3A__configure.ac&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDP=
h0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa6=
6m67E&amp;m=3Df-tqaJMvLQZsto9LmB4OqePZ_OjDN3dti7PPJVlvEhjKheIUAUdL0o3fi3YkQ=
4tk&amp;s=3Dj2m9TmXi_dMLEfSZID4zMoJqhFaWviDSvxcmjsPHbDE&amp;e=3D" rel=3D"no=
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
</blockquote></div>

--00000000000084335a063c164603--

