Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.26847.1592250737698036844
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 12:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=KOIzNYga;
 spf=pass (domain: linaro.org, ip: 209.85.219.181, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f181.google.com with SMTP id n123so9584866ybf.11
        for <docs@lists.yoctoproject.org>; Mon, 15 Jun 2020 12:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+nTqoy/WxZ+nzeEASXhZKCIh6o0ymAvwqqvNrIFJRmc=;
        b=KOIzNYgakvMcFw9EbJe8JIlAS67Ic3pcXLAHJBHm2znjTt2nLl1OVMnLOLxMoaoh5D
         x0wPIhXATkIXt/44QM4Z/wZJ68A8q45LfQIbe6jo+wb7AlqmnC9Hs967X1QIOy2uch+W
         nEFa2Chq6Jr3m5iZbwbtr+ET7/MmM3M4fg8ix4nfRshoHm3YIX6yX4UVY/fYRTQnAxum
         4bJCGIwZnCiGfhNhkBB4jZPEeL4WxM5gRiZ41cMI0Ffg0CLU2g1RrWTB8Yu9Xd257izX
         nAChFp9M8o45ZCoAl5oPYv+d6zON3vPr8bR6V5FwS1dUS8rWijD7WvfVgKtV2bsjPeI4
         pkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+nTqoy/WxZ+nzeEASXhZKCIh6o0ymAvwqqvNrIFJRmc=;
        b=OZkEIHPNU7uBn4UU+TVXi9Pi0hSYOgmmhDQYxyRZAdpoTA0Jqh0SdZk8wFfYJsnile
         JBs5hh6dTlIOvQJBPBVZsZ8hdvZCVVI5z0rWieLcN1H6Z/AoMcbFYGr11qqZ9Top2uAk
         2bOTdDXqmzepxBsZOJzYLp6FOHBMOabuVnN/CKttfSPDMuy+nSPmR4Wqx/tEdSiqJccK
         CJH2RFAUiF6MayZkIFXnZE7NERlVk9lilwcu0s1GeLNvfDAFc+KqMd45F5R/nxs7itAc
         ir35X9K0xRYgsKVbC+aLLVihXZ4rqiRp40wX44Jw9XAVQToAmqpqxMrBf9LFSr0UDkVv
         nccQ==
X-Gm-Message-State: AOAM5309T1wykQbI8nW2ZGTFzsVjb39ovagq+UmcMhLad4gDNJ4TTjVp
	GZ2BWzBxVHik154O2rc9Mc23SFSQJ66BVwN6jt3c5w==
X-Google-Smtp-Source: ABdhPJzc+ss1QGm9O1Sa6h/Am5qYN8nIjGbj4M1BT7Ti/hIespBEnp00o9K7fir4JnlT5xsF6rVV8/fUFpuOOXvDeaQ=
X-Received: by 2002:a25:3f87:: with SMTP id m129mr49490160yba.371.1592250736533;
 Mon, 15 Jun 2020 12:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <135fccacd4ee8a1ffe0e06f6f95c22e05dadf04a.camel@linuxfoundation.org>
 <20200415152105.GA11838@linux-uys3> <alpine.LFD.2.21.2004161247290.35575@localhost.localdomain>
 <CAP71WjxP3VE8YQo5sS43rOxWzhqhz40Zd2gkX2AGVYxNEdD8oQ@mail.gmail.com>
 <alpine.LFD.2.21.2004161345410.53638@localhost.localdomain>
 <CAP71WjwPdXB36essZJ62sogNq+Qpf1wx3cEGpjKQ3MTDmgFY7w@mail.gmail.com>
 <alpine.LFD.2.21.2004161404130.54465@localhost.localdomain>
 <DM6PR11MB367614B1115E7BA06017F79FE5B70@DM6PR11MB3676.namprd11.prod.outlook.com>
 <CAP71WjwWH-DVijt_bKwoNvHsUBvw3PwcN9yx6QKUiafAypf1yg@mail.gmail.com>
 <CAP71WjzD-AMauxpgbydY2fryU6+JU599UPRPXi_c582WvvfV6w@mail.gmail.com> <CAP71WjzwPHUXAGzKrbomfRGEFi+V_Cc9d60yGJM9JZ2Zx60FNQ@mail.gmail.com>
In-Reply-To: <CAP71WjzwPHUXAGzKrbomfRGEFi+V_Cc9d60yGJM9JZ2Zx60FNQ@mail.gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 15 Jun 2020 21:52:05 +0200
Message-ID: <CAP71WjyDn=JLYM0TVDWZ9CXdGxTgh+ZGhzxzVqMXcSff+jSOTA@mail.gmail.com>
Subject: Re: [docs] Possible changes to the project docs
To: Mark Morton <Mark.Morton@windriver.com>
Cc: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000008b7b6805a824c332"

--0000000000008b7b6805a824c332
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 12, 2020 at 1:52 PM Nicolas Dechesne <
nicolas.dechesne@linaro.org> wrote:

> hi Mark (Morton)
>
> On Tue, May 26, 2020 at 12:43 PM Nicolas Dechesne <
> nicolas.dechesne@linaro.org> wrote:
>
>>
>>
>> On Mon, May 25, 2020 at 9:33 AM Nicolas Dechesne <
>> nicolas.dechesne@linaro.org> wrote:
>>
>>> hi Mark,
>>>
>>>
>>> On Thu, May 21, 2020 at 10:42 PM Mark Morton <Mark.Morton@windriver.com>
>>> wrote:
>>>
>>>> Hi:
>>>>
>>>> I'd like to actually start planning this conversion to Sphinx. So far
>>>> myself, Rob D., Nicolas, and Tim O. are all interested in helping out.
>>>>
>>>> I'd like to have a Zoom meeting or something similar to get started on
>>>> where to go from Nico's proof of concept. Please let me know if you want to
>>>> attend - I'm thinking sometime early next week.
>>>>
>>>
>>> Thanks for starting this. I will be happy to help. I can prepare an
>>> 'initial' plan to get us started.
>>>
>>
>> Well.. I've started this wiki:
>> https://wiki.yoctoproject.org/wiki/Documentation_Sphinx
>>
>
> Can we find a time next week to get things going? I am in CET time zone,
> fwiw. How about any of the following time (I don't know where you are so
> using PST timezone)
>
> * Monday  9AM PST
> * Tuesday 10AM PST
> * Wed 9AM or 10AM PST
>

Just to update everyone, we have agreed to have a first meeting this week,
on Wed at 9AM PST time. The meeting has been added in the YP Google
Calendar as well (refer to
https://www.yoctoproject.org/public-virtual-meetings/)

And I am sharing the meeting details here as well

https://zoom.us/j/97588912425
<https://www.google.com/url?q=https://zoom.us/j/97588912425&sa=D&ust=1592682564242000&usg=AOvVaw261x8lemP-eSIOdWUOiTEc>
Meeting ID: 975 8891 2425 One tap mobile +12532158782,,97588912425# US
(Tacoma) +13462487799,,97588912425# US (Houston) Dial by your location +1
253 215 8782 US (Tacoma) +1 346 248 7799 US (Houston) +1 669 900 6833 US
(San Jose) +1 301 715 8592 US (Germantown) +1 312 626 6799 US (Chicago) +1
646 558 8656 US (New York) 877 369 0926 US Toll-free 855 880 1246 US
Toll-free +44 208 080 6591 United Kingdom +44 208 080 6592 United Kingdom
+44 330 088 5830 United Kingdom +44 131 460 1196 United Kingdom +44 203 481
5237 United Kingdom +44 203 481 5240 United Kingdom 0 800 260 5801 United
Kingdom Toll-free 0 800 031 5717 United Kingdom Toll-free +60 3 9212 1727
Malaysia +60 3 3099 2229 Malaysia 1 800 818 425 Malaysia Toll-free +55 21
3958 7888 Brazil +55 11 4680 6788 Brazil 0 800 878 3108 Brazil Toll-free 0
800 282 5751 Brazil Toll-free +52 229 910 0061 Mexico +52 554 161 4288
Mexico +52 556 826 9800 Mexico 800 733 4118 Mexico Toll-free 800 062 7287
Mexico Toll-free +64 9 884 6780 New Zealand +64 4 886 0026 New Zealand 0
800 527 544 New Zealand Toll-free 0 800 002 260 New Zealand Toll-free
Meeting ID: 975 8891 2425
Find your local number: https://zoom.us/u/adB5zrMbQ8
<https://www.google.com/url?q=https://zoom.us/u/adB5zrMbQ8&sa=D&ust=1592682564242000&usg=AOvVaw0DXi0h4wUmkZ03JQTC7xqf>



>
>>
>>
>>>
>>>
>>>>
>>>> Thanks,
>>>> -Mark M.
>>>>
>>>> > -----Original Message-----
>>>> > From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On
>>>> Behalf
>>>> > Of Robert P. J. Day
>>>> > Sent: Thursday, April 16, 2020 11:06 AM
>>>> > To: docs@lists.yoctoproject.org
>>>> > Subject: Re: [docs] Possible changes to the project docs
>>>> >
>>>> > On Thu, 16 Apr 2020, Nicolas Dechesne wrote:
>>>> >
>>>> > >
>>>> > >
>>>> > > On Thu, Apr 16, 2020 at 7:46 PM Robert P. J. Day <
>>>> rpjday@crashcourse.ca>
>>>> > wrote:
>>>> > >       On Thu, 16 Apr 2020, Nicolas Dechesne wrote:
>>>> > >
>>>> > >       > As I put in one of my emails before you can use my dev
>>>> branch:
>>>> > >       >
>>>> > >       >
>>>> https://git.linaro.org/people/nicolas.dechesne/poky.git/log/?h=sphinx
>>>> > >       >
>>>> > >       > then it's just
>>>> > >       > pip3 install sphinx
>>>> > >       > # to use the non default theme
>>>> > >       > pip3 install sphinx_rtd_theme
>>>> > >       >
>>>> > >       > cd documentation make html
>>>> > >       >
>>>> > >       > and it should generate exactly that on your local folder
>>>> > >       > https://people.linaro.org/~nicolas.dechesne/yp-docs/
>>>> > >       >
>>>> > >       > I am happy to take patches in this branch (or
>>>> create/maintain a
>>>> > >       > contrib branch if more folks want to play/experiment and
>>>> send
>>>> > >       > patches).
>>>> > >
>>>> > >         definitely need some mechanism to handle docbook entities
>>>> and basic
>>>> > >       tags like <filename> ... i'm still poring over pandoc, can it
>>>> be
>>>> > >       configured to deal with that?
>>>> > >
>>>> > >         will go read more ...
>>>> > >
>>>> > >
>>>> > > It does 'most of the time'. See:
>>>> > >
>>>> https://people.linaro.org/~nicolas.dechesne/yp-docs/bsp-guide/bsp.xml.
>>>> > > html#bsp-layers
>>>> > >
>>>> > > where the docbook source is:
>>>> > >        Each repository is a BSP layer supported by the Yocto Project
>>>> > >
>>>> > >
>>>> > >         (e.g. <filename>meta-raspberrypi</filename> and
>>>> > >
>>>> > >
>>>> > >         <filename>meta-intel</filename>).
>>>> > >
>>>> > >
>>>> > >  I am not sure if it always does the *right* thing though.. and I
>>>> have
>>>> > > seen occurrences where it failed. I am wondering if we should 'fix'
>>>> > > pandoc , or just spend some time fixing the output of pandoc.
>>>> > > I don't think we will avoid reading/checking each manual, anyways..
>>>> > > I was thinking we could use pandoc for 80% of the work, some regex
>>>> for
>>>> > > 15% and then manually finish the work.. it might be a bit optimistic
>>>> > > ;)
>>>> >
>>>> >   interesting ... if you go to the top-level page:
>>>> >
>>>> > https://people.linaro.org/~nicolas.dechesne/yp-docs/bsp-guide/bsp-
>>>> > guide.xml.html
>>>> >
>>>> > the <filename> tag in the third note is *not* migrated over, you can
>>>> still see
>>>> > the tag. i suspect there will be plenty of tweaking, but i'm still
>>>> totally on-board
>>>> > with this, and am willing to contribute.
>>>> >
>>>> > rday
>>>> 
>>>>
>>>

--0000000000008b7b6805a824c332
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 12, 2020 at 1:52 PM Nicol=
as Dechesne &lt;<a href=3D"mailto:nicolas.dechesne@linaro.org">nicolas.dech=
esne@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">hi Mark (Morton)</div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Ma=
y 26, 2020 at 12:43 PM Nicolas Dechesne &lt;<a href=3D"mailto:nicolas.deche=
sne@linaro.org" target=3D"_blank">nicolas.dechesne@linaro.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, May 25, 2020 at 9:33 AM Nicolas Dechesne &l=
t;<a href=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.=
dechesne@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">hi Mark,<div><br></div=
><div><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Thu, May 21, 2020 at 10:42 PM Mark Morton &lt;<a href=3D"mai=
lto:Mark.Morton@windriver.com" target=3D"_blank">Mark.Morton@windriver.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">H=
i:<br>
<br>
I&#39;d like to actually start planning this conversion to Sphinx. So far =
myself, Rob D., Nicolas, and Tim O. are all interested in helping out.<br>
<br>
I&#39;d like to have a Zoom meeting or something similar to get started on=
 where to go from Nico&#39;s proof of concept. Please let me know if you wa=
nt to attend - I&#39;m thinking sometime early next week.<br></blockquote><=
div><br></div><div>Thanks for starting this. I will be happy to help. I can=
 prepare an &#39;initial&#39; plan to get us started.=C2=A0</div></div></di=
v></blockquote><div><br></div><div>Well.. I&#39;ve started this wiki:=C2=A0=
<a href=3D"https://wiki.yoctoproject.org/wiki/Documentation_Sphinx" target=
=3D"_blank">https://wiki.yoctoproject.org/wiki/Documentation_Sphinx</a></d=
iv></div></div></blockquote><div><br></div><div>Can we find a time next wee=
k to get things going? I am in CET time zone, fwiw. How about any of the fo=
llowing time (I don&#39;t know where you are so using PST timezone)</div><d=
iv><br></div><div>* Monday=C2=A0 9AM PST</div><div>* Tuesday 10AM PST</div>=
<div>* Wed 9AM or 10AM PST</div></div></div></blockquote><div><br></div><di=
v>Just to update everyone, we have agreed to have a first meeting this week=
, on Wed at 9AM PST time. The meeting has been added in the YP Google Calen=
dar as well (refer to=C2=A0<a href=3D"https://www.yoctoproject.org/public-v=
irtual-meetings/">https://www.yoctoproject.org/public-virtual-meetings/</a>=
)</div><div><br></div><div>And I am sharing the meeting details here as wel=
l</div><div><br></div><a href=3D"https://www.google.com/url?q=3Dhttps://zoo=
m.us/j/97588912425&amp;sa=3DD&amp;ust=3D1592682564242000&amp;usg=3DAOvVaw26=
1x8lemP-eSIOdWUOiTEc" target=3D"_blank" style=3D"color:rgb(26,115,232);font=
-family:Roboto,Arial,sans-serif;font-size:14px;letter-spacing:0.2px;white-s=
pace:pre-wrap">https://zoom.us/j/97588912425</a><span style=3D"color:rgb(60=
,64,67);font-family:Roboto,Arial,sans-serif;font-size:14px;letter-spacing:0=
.2px;white-space:pre-wrap">

Meeting ID: 975 8891 2425
One tap mobile
+12532158782,,97588912425# US (Tacoma)
+13462487799,,97588912425# US (Houston)

Dial by your location
        +1 253 215 8782 US (Tacoma)
        +1 346 248 7799 US (Houston)
        +1 669 900 6833 US (San Jose)
        +1 301 715 8592 US (Germantown)
        +1 312 626 6799 US (Chicago)
        +1 646 558 8656 US (New York)
        877 369 0926 US Toll-free
        855 880 1246 US Toll-free
        +44 208 080 6591 United Kingdom
        +44 208 080 6592 United Kingdom
        +44 330 088 5830 United Kingdom
        +44 131 460 1196 United Kingdom
        +44 203 481 5237 United Kingdom
        +44 203 481 5240 United Kingdom
        0 800 260 5801 United Kingdom Toll-free
        0 800 031 5717 United Kingdom Toll-free
        +60 3 9212 1727 Malaysia
        +60 3 3099 2229 Malaysia
        1 800 818 425 Malaysia Toll-free
        +55 21 3958 7888 Brazil
        +55 11 4680 6788 Brazil
        0 800 878 3108 Brazil Toll-free
        0 800 282 5751 Brazil Toll-free
        +52 229 910 0061 Mexico
        +52 554 161 4288 Mexico
        +52 556 826 9800 Mexico
        800 733 4118 Mexico Toll-free
        800 062 7287 Mexico Toll-free
        +64 9 884 6780 New Zealand
        +64 4 886 0026 New Zealand
        0 800 527 544 New Zealand Toll-free
        0 800 002 260 New Zealand Toll-free
Meeting ID: 975 8891 2425=C2=A0</span><div><span style=3D"color:rgb(60,64,=
67);font-family:Roboto,Arial,sans-serif;font-size:14px;letter-spacing:0.2px=
;white-space:pre-wrap">Find your local number: </span><a href=3D"https://ww=
w.google.com/url?q=3Dhttps://zoom.us/u/adB5zrMbQ8&amp;sa=3DD&amp;ust=3D1592=
682564242000&amp;usg=3DAOvVaw0DXi0h4wUmkZ03JQTC7xqf" target=3D"_blank" styl=
e=3D"color:rgb(26,115,232);font-family:Roboto,Arial,sans-serif;font-size:14=
px;letter-spacing:0.2px;white-space:pre-wrap">https://zoom.us/u/adB5zrMbQ8<=
/a>=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gma=
il_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
-Mark M. <br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:docs@lists.yoctoproject.org" target=3D"_blank=
">docs@lists.yoctoproject.org</a> &lt;<a href=3D"mailto:docs@lists.yoctopro=
ject.org" target=3D"_blank">docs@lists.yoctoproject.org</a>&gt; On Behalf<b=
r>
&gt; Of Robert P. J. Day<br>
&gt; Sent: Thursday, April 16, 2020 11:06 AM<br>
&gt; To: <a href=3D"mailto:docs@lists.yoctoproject.org" target=3D"_blank">=
docs@lists.yoctoproject.org</a><br>
&gt; Subject: Re: [docs] Possible changes to the project docs<br>
&gt; <br>
&gt; On Thu, 16 Apr 2020, Nicolas Dechesne wrote:<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Apr 16, 2020 at 7:46 PM Robert P. J. Day &lt;<a href=3D"=
mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</a>&g=
t;<br>
&gt; wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Thu, 16 Apr 2020, Nicolas Dechesne =
wrote:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; As I put in one of my emails befo=
re you can use my dev branch:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://git.linaro.org=
/people/nicolas.dechesne/poky.git/log/?h=3Dsphinx" rel=3D"noreferrer" targe=
t=3D"_blank">https://git.linaro.org/people/nicolas.dechesne/poky.git/log/?h=
=
=3Dsphinx</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; then it&#39;s just<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; pip3 install sphinx<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; # to use the non default theme<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; pip3 install sphinx_rtd_theme<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; cd documentation make html<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; and it should generate exactly th=
at on your local folder<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://people.linaro.=
org/~nicolas.dechesne/yp-docs/" rel=3D"noreferrer" target=3D"_blank">https:=
//people.linaro.org/~nicolas.dechesne/yp-docs/</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I am happy to take patches in thi=
s branch (or create/maintain a<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; contrib branch if more folks want=
 to play/experiment and send<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; patches).<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 definitely need some mechanism =
to handle docbook entities and basic<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tags like &lt;filename&gt; ... i&#39;m=
 still poring over pandoc, can it be<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0configured to deal with that?<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 will go read more ...<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; It does &#39;most of the time&#39;. See:<br>
&gt; &gt; <a href=3D"https://people.linaro.org/~nicolas.dechesne/yp-docs/b=
sp-guide/bsp.xml" rel=3D"noreferrer" target=3D"_blank">https://people.linar=
o.org/~nicolas.dechesne/yp-docs/bsp-guide/bsp.xml</a>.<br>
&gt; &gt; html#bsp-layers<br>
&gt; &gt;<br>
&gt; &gt; where the docbook source is:<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0=C2=A0 Each repository is a BSP layer suppor=
ted by the Yocto Project<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 (e.g. &lt;filename&gt;meta-raspberry=
pi&lt;/filename&gt; and<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;filename&gt;meta-intel&lt;/filen=
ame&gt;).<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0I am not sure if it always does the *right* thing though..=
 and I have<br>
&gt; &gt; seen occurrences where it failed. I am wondering if we should &#=
39;fix&#39;<br>
&gt; &gt; pandoc , or just spend some time fixing the output of pandoc.<br=
>
&gt; &gt; I don&#39;t think we will avoid reading/checking each manual, an=
yways..<br>
&gt; &gt; I was thinking we could use pandoc for 80% of the work, some reg=
ex for<br>
&gt; &gt; 15% and then manually finish the work.. it might be a bit optimi=
stic<br>
&gt; &gt; ;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0interesting ... if you go to the top-level page:<br>
&gt; <br>
&gt; <a href=3D"https://people.linaro.org/~nicolas.dechesne/yp-docs/bsp-gu=
ide/bsp-" rel=3D"noreferrer" target=3D"_blank">https://people.linaro.org/~n=
icolas.dechesne/yp-docs/bsp-guide/bsp-</a><br>
&gt; guide.xml.html<br>
&gt; <br>
&gt; the &lt;filename&gt; tag in the third note is *not* migrated over, yo=
u can still see<br>
&gt; the tag. i suspect there will be plenty of tweaking, but i&#39;m stil=
l totally on-board<br>
&gt; with this, and am willing to contribute.<br>
&gt; <br>
&gt; rday<br>
<br>
</blockquote></div></div>
</blockquote></div></div>
</blockquote></div></div>
</blockquote></div></div>

--0000000000008b7b6805a824c332--
