Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web08.16236.1604075356947068409
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Oct 2020 09:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=r1HPD0Td;
 spf=pass (domain: linaro.org, ip: 209.85.219.171, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f171.google.com with SMTP id n142so5590512ybf.7
        for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2020 09:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=y60iyT1KHpiEf7AmFaDBf+lPLUV55dwQSDBuK7dpjOI=;
        b=r1HPD0Tdr1atHPrVlv6MbLVgoU6rAQ1kVxQ0O2cIckz3ShT+qFKnvmLcj3dcJD/2Ks
         17Pn16Ddx7aH5CJvuZzykToqHmucwv4swzsLuaxInTW/TOsi8/t3bGbv+BpFvO9CUSvD
         GlJWwmYYwM+QPGCncy+g7ooNt1bSYliRVTAQcrwqqVF/wldgSX4Q7DNVgmOrPiwcI4Ki
         yBLGSApMcnpUdowTpUJWZSIiA0XYgHwdaHErJbLPbAyvpeLEu6T2x1/s8awm6a6RGs8+
         /ZXIXIhF4TWNy3nlfQwku0Gq2qsZb2AnDe6HsmFVo77KGR4q6QaxEQAIlR+qUTKFkLWv
         RBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=y60iyT1KHpiEf7AmFaDBf+lPLUV55dwQSDBuK7dpjOI=;
        b=J3FJvii3diUsaBKTCcCHY3UF7GkRbRaSmfxJX9CWtiCeh/9wAuxPuHXYcpAZvEsJt5
         LNtGpVu1BXMQNfvvYa9R3fM14+6W+0iMlobbPAEXA5cnsDMYEaSMSPheMnAp96Xu+4Lh
         LpXgxCYYXgpThqBpfwPxUHFZ4BoPfMhl3eH48rxe0LfZHm8De4mw13O6BX01YFzyz+bB
         FCXTY2S2o0htiWD4LA26wc+/r4PU2tacARkaj1iNJ0OANjCAZFXwSiwKPaBoXvjQH6PF
         1Kpzxj9UnPj3/H/n2cDsjcm3EVwbbEBWHn5/u62aJ2M3fdDjIrZg1h/QTfaCQxEdZ7aC
         VMLg==
X-Gm-Message-State: AOAM5329kD2FLHqJLkCO8qEl/zHUqPI4nWXyansw06HtMklYkEyykzfS
	dBsGot1z7ueg7xGeFQoYO22Coc8et9iTZRgIKSXQXA==
X-Google-Smtp-Source: ABdhPJyi7NrXohV7Pv2j//52B9bLTzgWJipQysiVn8lnU0QDGl5jNHHkxcLgV8MO2h7VE8vxjvamNqi4aGNEe1ESkRM=
X-Received: by 2002:a25:8407:: with SMTP id u7mr4809515ybk.397.1604075356017;
 Fri, 30 Oct 2020 09:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <d39d9b0-512a-d035-cd5-f6313bf41d@crashcourse.ca>
 <CAP71Wjy0uvFbN4+yQHOteCVef0Jb9d98U_1jM05D2pc9Bx-iDQ@mail.gmail.com> <02192FE0-FFAB-43AC-A4F1-4B779EA28991@0leil.net>
In-Reply-To: <02192FE0-FFAB-43AC-A4F1-4B779EA28991@0leil.net>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 30 Oct 2020 17:29:05 +0100
Message-ID: <CAP71Wjz-Ho0B-4jfood12N6SCMDFoF1bu07necQtCxeD+T8Zsw@mail.gmail.com>
Subject: Re: [docs] possible marker cleanup: ": ::$" -> "::"
To: Quentin Schulz <foss@0leil.net>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>, "Robert P. J. Day" <rpjday@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2020 at 5:21 PM Quentin Schulz <foss@0leil.net> wrote:
>
> Hi all,
>
> On October 30, 2020 5:03:06 PM GMT+01:00, Nicolas Dechesne <nicolas.deche=
sne@linaro.org> wrote:
> >On Fri, Oct 30, 2020 at 4:07 PM Robert P. J. Day
> ><rpjday@crashcourse.ca> wrote:
> >>
> >>
> >>   in the midst of messing with "::" markers, i just noticed that
> >there
> >> is a *ton* of literal code block markers of the form:
> >>
> >>   ... blah blah: ::
> >>
> >>      code stuff
> >>
> >> this seems clearly overkill as the trailing "::" obviously starts a
> >> literal block, while the definition of the marker includes the
> >> explanation:
> >>
> >>   If it is preceded by whitespace, the marker is removed.
> >>
> >> in short, this appears to be *exactly* equivalent as if you had
> >simply
> >> written:
> >>
> >>   ... blah blah::
> >>
> >>      code stuff
> >>
> >> the apparent effect in the original being to start a literal block
> >> while leaving the preceding colon there -- just what ending with "::"
> >> provides. does that seem about right? one suspects there is a pile of
> >> marker simplification could be done.
> >
> >You are correct. all instances of ": ::" can be replaced with "::". If
> >you make the change, you will notice that the generated HTML is not
> >changing.
> >So it's a style question. I would prefer the short "::" form, let's
> >check with RP and Quentin first as they have been the main
> >contributors so far!
> >
>
> To be honest, I don't know much about reST. I learned the very basics of =
it while doing the clean ups.
>
> Anyway, I don't really like it because it's not that explicit (though it =
is documented) that :: without a space actually is identical to : ::. At th=
e same time, it's a "programming language" thing/quirk/implementation so I'=
m sure we can teach/document/enforce it as much as we would for Python or a=
ny other language one uses.
>
> The nice outcome out of this is consistency and I'm a sucker for that kin=
d of improvement, so all good for me.
>
>
>
> By the way, if we are starting to fix that kind of thing, I'd like to req=
uest some kind of guidelines, formatting rules, etc.. so that we have consi=
stency and make it easier both to contribute and to review? And put those i=
nto a README or something?
>
> E.g. I still have no clue on the max characters in a line. We also discus=
sed adding :term:`` for each variable in the glossary (probably same for ta=
sks/classes?). Still on my to-do list to not use <#blablbla> for internal l=
inks as sphinx does not detect broken links at build time when this is used=
. Basically anything that isn't specific to Sphinx but YP's documentation.

We should start a CODINGSTYLE document, I added a few things in the
README, but if we really want to add , perhaps a separate file is
better. But I agree we should do it. Like we could create an extension
that checks the syntax..  so many things to do!

>
> Anyway, that's off topic.
>
> Thanks Robert for sharing your knowledge and improving the docs :)
>
> Quentin
> --
> Sent from my Android device with K-9 Mail. Please excuse my brevity.
