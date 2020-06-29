Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web12.12839.1593410493820272694
 for <docs@lists.yoctoproject.org>;
 Sun, 28 Jun 2020 23:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OfenOp7I;
 spf=pass (domain: linaro.org, ip: 209.85.219.177, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f177.google.com with SMTP id h39so7867689ybj.3
        for <docs@lists.yoctoproject.org>; Sun, 28 Jun 2020 23:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mUhUUqVjDiSlHcFW6utRfSTH8PU0JV/k9fD5HgfkZBg=;
        b=OfenOp7IMpCzZVOuab7ZV08lxGsRp8Qc4P33AbI2YI6j1U1joeyXZ/yPIJoKneFL3/
         x2amTGOjynHwrAWIIlGn5L4hFF1ryR35g1yFo53x9anfbvS/xlFjWVgERdDHfW6foskK
         LO60ZsoSO2ULiH74Cc0vMLq67Ew2QU94bvnY8q+HxLQICEBIQ1wNszq0WRnU9GjFKTRB
         PqmJn25V7muV29VRrZFOfR5GeFjVMuxv6XU2SXwogE2PDJfV+DhyAyJ4/SB2/9t3xRLA
         hZZKzxP9DOnyHuSTKGTtsEaHHg3mfii2KGufLPXrNKXfM1Ns1LnLNmDxmEss5UuS6SZC
         eSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mUhUUqVjDiSlHcFW6utRfSTH8PU0JV/k9fD5HgfkZBg=;
        b=Ge3mjZzUZP+sbsIiXc0S+ijTgAnWPWR2ekS7yKAc7ULNSM5jDtWc8HFutSTtDwQMAk
         e/3aRl8kf3wTAkJGZLSyIPbPSrqgt7rI55Aot9MrVhZPBx2c7FHfOTtfj00bZihlm7ss
         axaquRfvc3g4eNacBLRwNMblTxBfbvkSjJ9HOQee9pwFX03pruIgb/3QPv+vzVuMOEXH
         3Bxw/MCGY9Fq0t0BaZfOyV+YdwroHRT3hIaAGaXEzGKbYECUSZvM1jTtnfaarf5o52Og
         zdJTHZJsJ+XfgQKFPueV8JgjKto7qPFOBXd4l7dZnJlkuALVoBju5WX1PP6cRUrhKdbN
         WVYw==
X-Gm-Message-State: AOAM531kvatcmXK74wsO+s1g7SL6RW82JPsPY03LPMW094RmZR9mlfnA
	iSxKzzExCZxzRkuTdkTH/hnhUxRpbBLu+NsnFUDXng==
X-Google-Smtp-Source: ABdhPJzgUAXRi0yRGrZUBHpwSa/lbQe6yRZHwoKmg/d/ylS+dCAKqNBspC2RH1DNjkX2g5/PLgpCJk4FfVqng0z6nho=
X-Received: by 2002:a25:da10:: with SMTP id n16mr20214267ybf.373.1593410492861;
 Sun, 28 Jun 2020 23:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <brBieKgFlfS0C1xLUD5I5LQ0ZKxNBkhcCwKfuzqZTPTQv9slA-1bH2sneuut6k6lMlCO1n_03w5D65oBcbwU2u9Q3ZdmvT-vUWqrLI2jN5c=@protonmail.com>
 <a1ce3e159c94a1826ff718670c8e3bb2195c155c.camel@linuxfoundation.org>
 <CAP71Wjz3=ugDGyfDirANko1KSXC-3qkfYGsuMAkuQ4QhTamzWA@mail.gmail.com>
 <fd811933-cb7e-d4fc-5363-4679f9e236fc@gmail.com> <CAP71Wjz8QeY9NkpR1Mmee4qpMWF-j-iJ_s+BqVH0DXd8O20WSQ@mail.gmail.com>
 <f8faaf6e-8dde-e806-6bba-0163d05d3d2b@gmail.com>
In-Reply-To: <f8faaf6e-8dde-e806-6bba-0163d05d3d2b@gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 29 Jun 2020 08:01:21 +0200
Message-ID: <CAP71Wjwg2DVhkpY5BTt9hpYzKmMVsgTzm6Hx8xHSzgR4pk5u+Q@mail.gmail.com>
Subject: Re: [docs] Modern style documentation
To: akuster808 <akuster808@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, marius.kriegerowski@protonmail.com, 
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000068acf205a932caa7"

--00000000000068acf205a932caa7
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 27, 2020 at 8:30 PM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 6/26/20 1:12 AM, Nicolas Dechesne wrote:
>
>
>
> On Thu, Jun 25, 2020 at 7:37 PM akuster808 <akuster808@gmail.com> wrote:
>
>> Hello,
>>
>>
>> On 6/24/20 7:27 AM, Nicolas Dechesne wrote:
>>
>> On Wed, Jun 24, 2020 at 4:23 PM Richard Purdie<richard.purdie@linuxfoundation.org> <richard.purdie@linuxfoundation.org> wrote:
>>
>> Hi,
>>
>> On Wed, 2020-06-24 at 14:05 +0000, Marius Kriegerowski vialists.yoctoproject.org wrote:
>>
>> Dear Community,
>> I would like to motivate a re-structuring of the documentation. The
>> single page documenting mega manual is great as it carries all the
>> information. But at the same time it is hard to navigate,
>> overwhelming for early stage users and hard to pick up where started
>> earlier on.
>> Are there plans that break this single page documentation?
>>
>> To be more constructive: I find it very convenient and I highly
>> recommend a permanently shown navigation bar, highlighting where the
>> current content is located. This allows to find information again,
>> even if a user only has a vague idea where a piece of information was
>> found last time, simply thanks to the iinherent structural pattern,
>> not only the text describing the chapters. Let's take advantage of
>> the humans being better at remembering shapes and patterns rather
>> than text and content.
>>
>> If this undertaking is already on it's way I'd be happy to join.
>>
>> Sorry I missed the meeting. I had a conflict with an internal meeting.
>>
>> One thing I would like to add to the things to look into is the ability
>> to:
>>
>> 1) Build documentation via a recipe
>>
> 2) Include documention  in an SDK
>>
>>
>> #1 is more for Build automation checkout etc and is needed for #2
>>
>> I realize this may be a meta-poky thing only.
>>
>
> Can you elaborate on what you are asking here? A recipe would need to
> 'fetch' the document sources with a fixed SRCREV. Or do you want to build
> the 'current' set of files from the documentation folder?
>
>
> Why not build the docs during core-image-minimal???   and yeah, the Docs
> are in their own repo so one could have a recipe to build the docs.
> Someone could do that today.
>

yes, it's simple to have a recipe. I was asking how we want to keep the
recipe up-to-date. I think that having a yocto-docs_git.bb recipe would
give the illusion that it creates the up-to-date documentation, so that
means we will have to keep changing SRCREV in the doc recipe...

if you build from oe-core+bitbake that might look ok, but if you build from
poky then you have a copy of the documentation in your workspace, but it's
not the one used when running bitbake yocto-docs.

I still like the idea though of building the docs with a recipe.. that
means we will have to move the following recipes (at least for now) into
oe-core since they are needed:
http://layers.openembedded.org/layerindex/recipe/105896/
http://layers.openembedded.org/layerindex/recipe/39741/



> -armin
>
>
>
>> Are there any other meeting scheduled?
>>
>
> Not at this point of time. I believe the next step was
> discussion/agreement from the TSC. and once that is done, we will start
> pushing a sphinx branch and hack on it.
>
>
>>
>>
>>
>> - armin
>>
>> I did notice the discussion on irc.
>>
>> FWIW we're in the middle of planning to migrate the documentation from
>> its current format in docbook over to sphinx. I think that should give
>> us more options for what you describe with navigation in amongst
>> various other advantages.
>>
>> Help with the migration would be much appreciated and we'll keep this
>> need in mind as we work through the details of this.
>>
>> I do think we'll end up with some kind of combination of both formats
>> since some people do need something searchable/scrollable but I realise
>> others need the navigation interface more, there is a place/need for
>> both.
>>
>> FWIW. you can check our current work-in-progress thoughts on this topic here:https://wiki.yoctoproject.org/wiki/index.php?title=Documentation_Sphinx
>>
>>  Cheers,
>>
>> Richard
>>
>>
>>
>>
>> 
>>
>>
>>
>

--00000000000068acf205a932caa7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jun 27, 2020 at 8:30 PM akust=
er808 &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
  
    
  
  <div>
    <br>
    <br>
    <div>On 6/26/20 1:12 AM, Nicolas Dechesne
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 25, 2020 at 7:=
37
            PM akuster808 &lt;<a href=3D"mailto:akuster808@gmail.com" targ=
et=3D"_blank">akuster808@gmail.com</a>&gt; wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div> Hello,<br>
              <br>
              <br>
              <div>On 6/24/20 7:27 AM, Nicolas Dechesne wrote:<br>
              </div>
              <blockquote type=3D"cite">
                <pre>On Wed, Jun 24, 2020 at 4:23 PM Richard Purdie
<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">&l=
t;richard.purdie@linuxfoundation.org&gt;</a> wrote:
</pre>
                <blockquote type=3D"cite">
                  <pre>Hi,

On Wed, 2020-06-24 at 14:05 +0000, Marius Kriegerowski via
<a href=3D"http://lists.yoctoproject.org" target=3D"_blank">lists.yoctopro=
ject.org</a> wrote:
</pre>
                  <blockquote type=3D"cite">
                    <pre>Dear Community,
I would like to motivate a re-structuring of the documentation. The
single page documenting mega manual is great as it carries all the
information. But at the same time it is hard to navigate,
overwhelming for early stage users and hard to pick up where started
earlier on.
Are there plans that break this single page documentation?

To be more constructive: I find it very convenient and I highly
recommend a permanently shown navigation bar, highlighting where the
current content is located. This allows to find information again,
even if a user only has a vague idea where a piece of information was
found last time, simply thanks to the iinherent structural pattern,
not only the text describing the chapters. Let&#39;s take advantage of
the humans being better at remembering shapes and patterns rather
than text and content.

If this undertaking is already on it&#39;s way I&#39;d be happy to join.</=
pre>
                  </blockquote>
                </blockquote>
              </blockquote>
              Sorry I missed the meeting. I had a conflict with an
              internal meeting.<br>
              <br>
              One thing I would like to add to the things to look into
              is the ability to:<br>
              <br>
              1) Build documentation via a recipe=C2=A0</div>
          </blockquote>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div> 2) Include documention=C2=A0 in an SDK<br>
              <br>
              <br>
              #1 is more for Build automation checkout etc and is needed
              for #2<br>
              <br>
              I realize this may be a meta-poky thing only.<br>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>Can you elaborate on what you are asking here? A recipe
            would need to &#39;fetch&#39; the document sources with a fixe=
d
            SRCREV. Or do you want to build the &#39;current&#39; set of f=
iles
            from the documentation folder?=C2=A0 <br>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Why not build the docs during core-image-minimal???=C2=A0=C2=A0 and ye=
ah, the
    Docs are in their own repo so one could have a recipe to build the
    docs.=C2=A0 Someone could do that today.<br></div></blockquote><div><b=
r></div><div>yes, it&#39;s simple to have a recipe. I was asking how we wan=
t to keep the recipe up-to-date. I think that having a <a href=3D"http://yo=
cto-docs_git.bb">yocto-docs_git.bb</a> recipe would give the illusion that =
it creates the up-to-date documentation, so that means we will have to keep=
 changing SRCREV in the doc recipe...=C2=A0</div><div><br></div><div>if you=
 build from oe-core+bitbake that might look ok, but if you build from poky =
then you have a copy of the documentation in your workspace, but it&#39;s n=
ot the one used when running bitbake yocto-docs.</div><div><br></div><div>I=
 still like the idea though of building the docs with a recipe.. that means=
 we will have to move the following recipes (at least for now) into oe-core=
 since they are needed:</div><div><a href=3D"http://layers.openembedded.org=
/layerindex/recipe/105896/">http://layers.openembedded.org/layerindex/recip=
e/105896/</a><br></div><div><a href=3D"http://layers.openembedded.org/layer=
index/recipe/39741/">http://layers.openembedded.org/layerindex/recipe/39741=
/</a><br></div><div><br></div><div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div>
    <br>
    -armin<br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div><br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div> <br>
              Are there any other meeting scheduled?<br>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>Not at this point of time. I believe the next step was
            discussion/agreement from the TSC. and once that is done, we
            will start pushing a sphinx branch and hack on it.</div>
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div> <br>
              <br>
              <br>
              - armin<br>
              <blockquote type=3D"cite">
                <blockquote type=3D"cite">
                  <pre>I did notice the discussion on irc.

FWIW we&#39;re in the middle of planning to migrate the documentation from
its current format in docbook over to sphinx. I think that should give
us more options for what you describe with navigation in amongst
various other advantages.

Help with the migration would be much appreciated and we&#39;ll keep this
need in mind as we work through the details of this.

I do think we&#39;ll end up with some kind of combination of both formats
since some people do need something searchable/scrollable but I realise
others need the navigation interface more, there is a place/need for
both.
</pre>
                </blockquote>
                <pre>FWIW. you can check our current work-in-progress thou=
ghts on this topic here:
<a href=3D"https://wiki.yoctoproject.org/wiki/index.php?title=3DDocumentat=
ion_Sphinx" target=3D"_blank">https://wiki.yoctoproject.org/wiki/index.php?=
title=3DDocumentation_Sphinx</a>


</pre>
                <blockquote type=3D"cite">
                  <pre>Cheers,

Richard


</pre>
                  <br>
                  <fieldset></fieldset>
                  <pre>
</pre>
                </blockquote>
              </blockquote>
              <br>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </div>

</blockquote></div></div>

--00000000000068acf205a932caa7--
