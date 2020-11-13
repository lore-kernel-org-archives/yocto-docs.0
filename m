Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com [209.85.219.194])
 by mx.groups.io with SMTP id smtpd.web12.2364.1605262460015504366
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Nov 2020 02:14:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=sbUWCEFZ;
 spf=pass (domain: linaro.org, ip: 209.85.219.194, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f194.google.com with SMTP id g15so8207385ybq.6
        for <docs@lists.yoctoproject.org>; Fri, 13 Nov 2020 02:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cC0GS4tRmYSVBIe36GHVcqw+fW3LjFHdhhVyulyPI6M=;
        b=sbUWCEFZ0VvmcyrAW1WXgSAUawBMScuTYqJFPlTduX4Ozcqe5EhtMq192yoc1pQxpI
         m8bwXg0r4OSlzzP7h4EFTKcmqFmvJTpVIdwLTCSvUpEpdJEtTN/sZWTr0IpVFlkG5K8P
         bCdljkDi4rLKSDEeeZYJaVGcM0vtOuXZ/eWoSButVWgr1A+OGG1gFHKEWLmxt+zsXYnI
         n0PjmtxIRJikPNP8z5EkMHH6e9viqK/PHzNJhgxZ7HjsuXFpkchhqSDXhRfCGHfTcUAZ
         Fo5XOClEAeZ3zwKxzL6BU7vZ26EqeFTX70CAPKr8UZaximIFjVufFsZta8ySoWjtmtty
         biKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cC0GS4tRmYSVBIe36GHVcqw+fW3LjFHdhhVyulyPI6M=;
        b=feTEwXY+pXY9RY6siG9EGDtwVL308zEoEm4LQQaocUx3LaJ4FXw7Dj6d65FHfqSs6J
         +Rp9xKzk/anOTohmzEXYkJ4I6mRLBLhApcDUh6Oh5RlkhJ/727EOW+XdfMugsH0+vztR
         CYFkhucg2HU5+4xQqfaYPjBXVbFZ7vddb01UTtx3MMXsVcGrzq8UcsjM5JdoMRaJAkqQ
         Fh/gA7KQPoN6qZ6KvGA72NElrPLmc/7vUvcdekENXYncSOLHIOWAAcWDELUnG17mj8o4
         UzhLatIq9JGxOULHwYLllcqjM+Y9ioadWiYu0o9mirp2ebTSBNxns0Z3pgG+TsExyDDw
         z2/A==
X-Gm-Message-State: AOAM530sKFakZZ4OX5Vf02pRhtpVfG/tJVL7hHnpLMM8NvM0BiLuASTp
	WGUSJa/02HHx7kOL65DzXeJ28VEyLBWWr2wGrybY+w==
X-Google-Smtp-Source: ABdhPJx/eQeuT/a6xaiplsKE/+Zg2RH09vSvqW3gOU5ORODkiOlROttbJRN2SJBFPvj3iYqDf3OJ2iApFUaOjC0ORL8=
X-Received: by 2002:a25:8250:: with SMTP id d16mr1836711ybn.133.1605262459052;
 Fri, 13 Nov 2020 02:14:19 -0800 (PST)
MIME-Version: 1.0
References: <20201113095431.7425-1-pbarker@konsulko.com>
In-Reply-To: <20201113095431.7425-1-pbarker@konsulko.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 13 Nov 2020 11:14:08 +0100
Message-ID: <CAP71WjxRNQcppAtzJbHdu9wwzQVrWDc5wO=AyNJggCjY5=iC=A@mail.gmail.com>
Subject: Re: [PATCH] conf.py: Improve TOC and Outline depth in PDF output
To: Paul Barker <pbarker@konsulko.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 13, 2020 at 10:54 AM Paul Barker <pbarker@konsulko.com> wrote:
>
> The default PDF output shows only chapter headings in the table of
> contents and in the outline (aka PDF bookmarks). We should override
> these defaults to set something more suitable.
>
> With a depth of 2 for the TOC we see both section and subsection
> headings which is enough to get the list of classes in the reference
> manual and the list of topics under "Common Tasks" in the development
> manual. Going to a deeper level would make the TOC unwieldy but we do
> want to make sure we can navigate more precisely using the outline
> (commonly shown in a left tab in PDF viewers) so we set the depth to 5
> for the outline.

thanks, it is indeed much better! I updated the file here so that
everyone can check it:
https://people.linaro.org/~nicolas.dechesne/theyoctoproject.pdf

>
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> ---
>  documentation/conf.py | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 9a0186f35..a8df6e8f8 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -124,3 +124,8 @@ html_last_updated_fmt = '%b %d, %Y'
>
>  # Remove the trailing 'dot' in section numbers
>  html_secnumber_suffix = " "
> +
> +latex_elements = {
> +    'passoptionstopackages': '\PassOptionsToPackage{bookmarksdepth=5}{hyperref}',
> +    'preamble': '\setcounter{tocdepth}{2}',
> +}
> --
> 2.20.1
>
