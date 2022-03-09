Return-Path: <svet.am@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CB3C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 23:48:32 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web09.3894.1646869712043309851
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Mar 2022 15:48:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dk8pKUo5;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: svet.am@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-2db2add4516so41170017b3.1
        for <docs@lists.yoctoproject.org>;
 Wed, 09 Mar 2022 15:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EjGHg1p3kkQbWkkf0ecifZ4UvDDtszfRwF3epAdUqtc=;
        b=Dk8pKUo5jxkLpinyi+ZaY1ggFQ/qHRdJvpuok5NhCE4LVr26WHHLFSJE5dgkKI8Yot
         PauUgaZybkUArgIToxBaD+KMJkzlGBKLF0bzoIYGRWICeAh33GF93p3AMb3geKqkpvRz
         DgjkEVSx0GpeFR0/BnYrpNJqn4TFGU2yjfGoG/SDXR12yw3eKbaposA6JAe9Nw6oiDa5
         F5OGqfYQRET44hNPtdGQfodC1vlq3Osvp/vsErls8lA1vW2jM8S6ej9vK5MfdzntGuJL
         NiYU+j48mRaw3QY/Y/uK8r1qhqKB6LEcNnCaD1WUgN7dObjLbjLfGAelEG+Ky60uHdSJ
         asbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EjGHg1p3kkQbWkkf0ecifZ4UvDDtszfRwF3epAdUqtc=;
        b=zaor+uzqK4dTFlpfhINpyHxupjpIrFCkjSeFT5teTcz5FWKckSaBzzaIIFF9WLRqiW
         7wBgGEdL8r6g9dZ+O0zEwLm0yvkN+cBtTgsAjpk/meWEsUjvuJvpPJZ1kKePpzmUztD0
         ZAaxUnOfQF9sKgsfR42EFWOUfEhVbim3oTLVvUI9U4fu8Sp21ZYPtI6Vtkc4AzB3Vxd3
         sgCj4E6PiJnxRIIPEjzyGVg1jBEc+rRPxCTlj5Fzleu4IBbVZovl93VPor2frCrymFuu
         zn1rSMLZ+5md29OH0RJEqEYA2MD/dFsOBU2kRb/dUbrN8YGcU+uvwSqfMUhI8gZTp0zE
         QMXg==
X-Gm-Message-State: AOAM5318OHFvFX9N1YIINLxYQ2YqMP92DrffAOBXUa/yxZnj+PgjApCO
	2xkJRsYy7/uI7Z+PYpLkM+xRChllAqrFW1zJM3ylDvN1PHE=
X-Google-Smtp-Source: 
 ABdhPJy6C9HS8heLnOUnYdFBHOL+aHIv3coCdR3fxtxju3NjnKae9NAA0Vw5CGSVS8JSGNGUY3ZNP1/OIqMdWlnPWB8=
X-Received: by 2002:a81:996:0:b0:2dc:374c:51d2 with SMTP id
 144-20020a810996000000b002dc374c51d2mr1938422ywj.414.1646869711004; Wed, 09
 Mar 2022 15:48:31 -0800 (PST)
MIME-Version: 1.0
References: 
 <CADmuqUfgVBj28RbjVwGGxcT2NnP2k=DxSZ8z6C=miBqtncoN4w@mail.gmail.com>
 <41207cc8-39a1-8257-0193-4fa353a7e662@bootlin.com>
 <CADmuqUf4APus--UcjJPogGcDA3Eru=-Z16c3iO2vOi9Wgw_=Wg@mail.gmail.com>
 <152aa65e-c736-81dd-360d-94877bdfa769@bootlin.com>
In-Reply-To: <152aa65e-c736-81dd-360d-94877bdfa769@bootlin.com>
From: Tony McDowell <svet.am@gmail.com>
Date: Wed, 9 Mar 2022 16:48:20 -0700
Message-ID: 
 <CADmuqUfyZgc+W-W2-38v1OAkZSa1MoDNNuLczQnGW-DxOBaOjQ@mail.gmail.com>
Subject: Re: [docs] [PATCH] dev-manual: add instructions for compacting WSLv2
 VHDX files using DiskPart for those systems which lack optimize-vhd
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/mixed; boundary="0000000000001df09205d9d1bc0b"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Mar 2022 23:48:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2567

--0000000000001df09205d9d1bc0b
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 9, 2022 at 8:57 AM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hi Tony,
>
> On 3/9/22 16:53, Tony McDowell wrote:
> >
> > Thanks, Michael.  I think the problem is that I created it with
> > TortoiseGit on Windows and it didn't capture the proper context of the
> > files.  I'll try to fix it today and resubmit.  For the etiquette of
> > this mailing list, should that be a new patch email or as a reply on
> > this one?
>
>
> Thanks for asking!
> I believe it's best to send the new patch as a reply on this thread, but
> this is not a very strict requirement :)
>
> I suggest you to send your patch to yourself first, save the message to
> a file, create a new branch from "master" and try to apply your patch
> using "git am <file>".
> Thanks in advance
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

Hi Michael:

I was able to apply my patch directly against the yocto-docs repo and
it applied without issue and I saw the change show up in start.rst
like I expected.  I have attached the .patch file that TortoiseGit
generated for me if that works more easily for you.

thanks
.tony

--0000000000001df09205d9d1bc0b
Content-Type: application/octet-stream;
	name="0001-dev-manual-add-instructions-for-compacting-WSLv2-VHD.patch"
Content-Disposition: attachment;
	filename="0001-dev-manual-add-instructions-for-compacting-WSLv2-VHD.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l0k7otyo0>
X-Attachment-Id: f_l0k7otyo0

RnJvbSA2MmU4OWNhOTY5MWFjMGQyMTg4ZTQzNDQ1OTc0ZDQxZWNhZmMyYWY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUb255IE1jRG93ZWxsIDxzdmV0LmFtQGdtYWlsLmNvbT4KRGF0
ZTogVHVlLCA4IE1hciAyMDIyIDE5OjI1OjE1IC0wNzAwClN1YmplY3Q6IFtQQVRDSF0gZGV2LW1h
bnVhbDogYWRkIGluc3RydWN0aW9ucyBmb3IgY29tcGFjdGluZyBXU0x2MiBWSERYIGZpbGVzCiB1
c2luZyBEaXNrUGFydCBmb3IgdGhvc2Ugc3lzdGVtcyB3aGljaCBsYWNrIG9wdGltaXplLXZoZAoK
LS0tCiBkb2N1bWVudGF0aW9uL2Rldi1tYW51YWwvc3RhcnQucnN0IHwgMTMgKysrKysrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZG9jdW1lbnRhdGlvbi9kZXYtbWFudWFsL3N0YXJ0LnJzdCBiL2RvY3VtZW50YXRp
b24vZGV2LW1hbnVhbC9zdGFydC5yc3QKaW5kZXggOWM3ZGRlOGNmLi44MDI4OGI2MDcgMTAwNjQ0
Ci0tLSBhL2RvY3VtZW50YXRpb24vZGV2LW1hbnVhbC9zdGFydC5yc3QKKysrIGIvZG9jdW1lbnRh
dGlvbi9kZXYtbWFudWFsL3N0YXJ0LnJzdApAQCAtNTIzLDggKzUyMyw3IEBAIHlvdXIgWW9jdG8g
UHJvamVjdCBidWlsZCBob3N0OgogICAgICAgWW91ciBWSERYIGZpbGUgcGF0aCBpczoKICAgICAg
IGBgQzpcVXNlcnNcbXl1c2VyXEFwcERhdGFcTG9jYWxcUGFja2FnZXNcQ2Fub25pY2FsR3JvdXBM
aW1pdGVkLlVidW50dW9uV2luZG93c183OWFiY2RlZmdoXExvY2FsU3RhdGVcZXh0NC52aGR4YGAK
IAotICAgMi4gKk9wdGltaXplIHlvdXIgVkhEWCBmaWxlOiogT3BlbiBhIFdpbmRvd3MgUG93ZXJz
aGVsbCBhcwotICAgICAgQWRtaW5pc3RyYXRvciB0byBvcHRpbWl6ZSB5b3VyIFZIRFggZmlsZSwg
c2h1dHRpbmcgZG93biBXU0wgZmlyc3Q6OgorICAgMmEuICpPcHRpbWl6ZSB5b3VyIFZIRFggZmls
ZSB1c2luZyBXaW5kb3dzIFBvd2Vyc2hlbGw6KiBUbyB1c2UgdGhlIG9wdGltaXplLXZoZCBjbWRs
ZXQgYmVsb3csIGZpcnN0IGluc3RhbGwgdGhlIEh5cGVyLVYgb3B0aW9uIG9uIFdpbmRvd3MuICBU
aGVuLCBvcGVuIGEgV2luZG93cyBQb3dlcnNoZWxsIGFzIEFkbWluaXN0cmF0b3IgdG8gb3B0aW1p
emUgeW91ciBWSERYIGZpbGUsIHNodXR0aW5nIGRvd24gV1NMIGZpcnN0OjoKIAogICAgICAgICAg
QzpcV0lORE9XU1xzeXN0ZW0zMj4gd3NsIC0tc2h1dGRvd24KICAgICAgICAgIEM6XFdJTkRPV1Nc
c3lzdGVtMzI+IG9wdGltaXplLXZoZCAtUGF0aCBDOlxVc2Vyc1xteXVzZXJcQXBwRGF0YVxMb2Nh
bFxQYWNrYWdlc1xDYW5vbmljYWxHcm91cExpbWl0ZWQuVWJ1bnR1b25XaW5kb3dzXzc5YWJjZGVm
Z2hcTG9jYWxTdGF0ZVxleHQ0LnZoZHggLU1vZGUgZnVsbApAQCAtNTMzLDYgKzUzMiwxNiBAQCB5
b3VyIFlvY3RvIFByb2plY3QgYnVpbGQgaG9zdDoKICAgICAgIFZIRFggZmlsZSwgYW5kIHN0b3Jh
Z2Ugc2hvdWxkIG5vdyBiZSByZWZsZWN0ZWQgY29ycmVjdGx5IG9uIHRoZQogICAgICAgV2luZG93
cyBFeHBsb3Jlci4KIAorICAgMmIuICpPcHRpbWl6ZSB5b3VyIFZIRFggZmlsZSB1c2luZyBEaXNr
UGFydDoqIFRoZSBvcHRpbWl6ZS12aGQgY21kbGV0IG5vdGVkIGluIHN0ZXAgMmEgYWJvdmUgaXMg
cHJvdmlkZWQgYnkgSHlwZXItVi4gIE5vdCBhbGwgU0tVcyBvZiBXaW5kb3dzIGNhbiBpbnN0YWxs
IEh5cGVyLVYuICBBcyBhbiBhbHRlcm5hdGl2ZSwgdXNlIHRoZSBEaXNrUGFydCB0b29sLiAgVG8g
c3RhcnQsIG9wZW4gYSBXaW5kb3dzIGNvbW1hbmQgcHJvbXB0IGFzIEFkbWluaXN0cmF0b3IgdG8g
b3B0aW1pemUgeW91ciBWSERYIGZpbGUsIHNodXR0aW5nIGRvd24gV1NMIGZpcnN0OjoKKwkgICAK
KyAgICAgICAgIEM6XFdJTkRPV1Ncc3lzdGVtMzI+IHdzbCAtLXNodXRkb3duCisgICAgICAgICBD
OlxXSU5ET1dTXHN5c3RlbTMyPiBkaXNrcGFydAorCQkgCisgICAgICAgICBESVNLUEFSVD4gc2Vs
ZWN0IHZkaXNrIGZpbGU9IjxwYXRoX3RvX1ZIRFhfZmlsZT4iCisgICAgICAgICBESVNLUEFSVD4g
YXR0YWNoIHZkaXNrIHJlYWRvbmx5CisgICAgICAgICBESVNLUEFSVD4gY29tcGFjdCB2ZGlzawor
ICAgICAgICAgRElTS1BBUlQ+IGV4aXQKKwkJIAogLi4gbm90ZTo6CiAKICAgIFRoZSBjdXJyZW50
IGltcGxlbWVudGF0aW9uIG9mIFdTTHYyIGRvZXMgbm90IGhhdmUgb3V0LW9mLXRoZS1ib3gKLS0g
CjIuMzEuMS53aW5kb3dzLjEKCg==
--0000000000001df09205d9d1bc0b--

