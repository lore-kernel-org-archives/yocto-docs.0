Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
 by mx.groups.io with SMTP id smtpd.web11.20476.1606491219320358692
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Nov 2020 07:33:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=teOQtOq9;
 spf=pass (domain: linaro.org, ip: 209.85.219.196, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f196.google.com with SMTP id 10so4855036ybx.9
        for <docs@lists.yoctoproject.org>; Fri, 27 Nov 2020 07:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qu0UEWW/sZqtVuh5pnz4ngjWGPaZ80NJidDgGTIDhfc=;
        b=teOQtOq9v+ON1+eCbYnhCTkBOvBQyJRpH2IWg74vN15Ys7Dx64b40k7eBz2Ets5/Z/
         3YVEiAxq1m/44I0LPBC+UMwWJKiGMEIN3WV1QBqTfirsq3W1WlzFMg92hCona7z5yDf3
         nC5mmyRrNPRyRDogq6pQ6oUVinv1WeIdZN4SNbzqoJeF1QR3uJgipG+6ogH06BYSNqnz
         1SA5pAqrdPNg4L2ybOhic24HdTS6WmkpUut0koZn1FHtRPcCtig5wK0T7t805aFTf8eE
         HjNUq6mJI0UwEOSpM4UxPUdCeHb8EHilIcswmtIlicpgOpSFxMxGqTmyTvOew5RYPbtp
         RclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qu0UEWW/sZqtVuh5pnz4ngjWGPaZ80NJidDgGTIDhfc=;
        b=A7xPQhkYiDquFkanoYvVJfXu8SqDuYxIDg64CZkJ6Rh2Mu9ck8yQv3I1CzNWFNEjpv
         oDLUEICnTPbrkf+ZJjdEorbZpbq5vV1d3jJYD2lNCVRgPlQXbPgfIMdO8uelvi9STR5z
         REolLWZBLbkrwS2uhFkUBUOz2/mHwnpXTesbPtSGopoPiwKN3J8n+tqk0QagCRkikRqE
         X7FsTrhCwRf+i2NT/0YwaPrHrx4S50QaNKlWs560qnASmiIWhx9CtE28KxFsL7lNXd6K
         YcNkf8+IhP8brrtQgot7nTTvM0csUW27oiV1iRJU+fcfy+PTT/NVyHwxHSZafQjYHrh7
         bWsw==
X-Gm-Message-State: AOAM531Z2Q4uskBpQngMKj6M5be0vMbEgiab5m6wE9k5JCOQXsxz0Oxi
	8t1GXGFmQmDs3n45ZlM//ryNNSZANE2p7rki1t5eNg==
X-Google-Smtp-Source: ABdhPJw075p3K+BKvWpoIbvbiMtc6esNae/Dp5dk6wTPZwVmO5QHu+Fvv09e5Zewx7x89F+KuYG51ecDWVedbIT+W+w=
X-Received: by 2002:a25:bcc6:: with SMTP id l6mr10360044ybm.475.1606491218436;
 Fri, 27 Nov 2020 07:33:38 -0800 (PST)
MIME-Version: 1.0
References: <20201127151910.6397-1-pbarker@konsulko.com> <20201127151910.6397-3-pbarker@konsulko.com>
In-Reply-To: <20201127151910.6397-3-pbarker@konsulko.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 27 Nov 2020 16:33:27 +0100
Message-ID: <CAP71WjwHuc1LXG0Jh7by0JZ7Yk9kwKwx43wXVD9Bqb1R8JFTpw@mail.gmail.com>
Subject: Re: [docs] [PATCH 2/3] documentation: Simplify yocto_git links
To: Paul Barker <pbarker@konsulko.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 27, 2020 at 4:19 PM Paul Barker <pbarker@konsulko.com> wrote:
>
> The yocto_git external link directive is modified to include the
> `/cgit/cgit.cgi` element of the URL so that we can simplify the links in
> the text.
>
> Manual links to git.yoctoproject.org are converted to use the yocto_git
> directive where possible. Note that this directive can't be used in some
> places such as example code.
>
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> ---
>  documentation/bsp-guide/bsp.rst               | 21 +++++-----
>  documentation/conf.py                         |  2 +-
>  .../dev-manual/dev-manual-common-tasks.rst    | 39 +++++++++----------
>  documentation/dev-manual/dev-manual-start.rst |  4 +-
>  .../kernel-dev/kernel-dev-advanced.rst        |  4 +-
>  .../kernel-dev/kernel-dev-maint-appx.rst      |  4 +-
>  .../overview-manual-concepts.rst              | 17 ++++----
>  ...verview-manual-development-environment.rst |  7 ++--
>  .../overview-manual-yp-intro.rst              | 12 +++---
>  documentation/ref-manual/migration-1.3.rst    |  2 +-
>  documentation/ref-manual/migration-1.6.rst    |  2 +-
>  documentation/ref-manual/migration-2.2.rst    |  4 +-
>  documentation/ref-manual/migration-2.3.rst    |  2 +-
>  documentation/ref-manual/migration-2.5.rst    |  6 +--
>  documentation/ref-manual/migration-3.0.rst    |  2 +-
>  documentation/ref-manual/ref-classes.rst      |  2 +-
>  .../ref-manual/ref-devtool-reference.rst      |  4 +-
>  documentation/ref-manual/ref-tasks.rst        |  2 +-
>  documentation/ref-manual/ref-terms.rst        |  4 +-
>  documentation/ref-manual/ref-variables.rst    |  2 +-
>  .../test-manual/test-manual-intro.rst         |  4 +-
>  .../test-manual/test-manual-test-process.rst  |  6 +--
>  .../toaster-manual-reference.rst              | 15 +++----
>  .../toaster-manual-setup-and-use.rst          |  4 +-
>  24 files changed, 80 insertions(+), 91 deletions(-)
>
> diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
> index d6a4f545c..357e740a5 100644
> --- a/documentation/bsp-guide/bsp.rst
> +++ b/documentation/bsp-guide/bsp.rst
> @@ -172,8 +172,7 @@ section.
>  #. *Optionally Clone the meta-intel BSP Layer:* If your hardware is
>     based on current Intel CPUs and devices, you can leverage this BSP
>     layer. For details on the ``meta-intel`` BSP layer, see the layer's
> -   `README <http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/tree/README>`__
> -   file.
> +   :yocto_git:`README </meta-intel/tree/README>` file.

Same question here, as with :yocto_wiki:, can we get rid of the 'leading' / ?

>
>     #. *Navigate to Your Source Directory:* Typically, you set up the
>        ``meta-intel`` Git repository inside the :term:`Source Directory` (e.g.
> @@ -902,13 +901,13 @@ Yocto Project:
>     ``meta-bsp_root_name`` directory. This license covers the BSP
>     Metadata as a whole. You must specify which license to use since no
>     default license exists when one is not specified. See the
> -   :yocto_git:`COPYING.MIT </cgit.cgi/meta-raspberrypi/tree/COPYING.MIT>`
> +   :yocto_git:`COPYING.MIT </meta-raspberrypi/tree/COPYING.MIT>`
>     file for the Raspberry Pi BSP in the ``meta-raspberrypi`` BSP layer
>     as an example.
>
