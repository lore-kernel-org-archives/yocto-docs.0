Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28AA0E9B261
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 12:53:10 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19516.1771937586554217037
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 04:53:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=Avs3lscg;
 spf=pass (domain: cherry.de, ip: 52.101.70.15, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7OYnlYX5xF9iIoFe4mrnX/efJwxxYjQfbeWSn4UAnF5+ys+EnpC7ENCc5q41osVM7G+snOeel9Iu86ex2oL36Dqr3Nvh+pbufvOqYrPgkaUtgvy8WkzV2qTBfaVW6UXQtQZf/zM2YiDtXYtOIi5I2tYk85fc1x9Sp60LuN6DzRSbk4zp4bzbJn8Te+P7+K6erUBStYc3G302jddxywpNV3rNjYYzFwEPsEzP56wm3vqujdf6sFULb9Tmc/gUnGzLv+t5PLuoAkv3++bwo5N7DZDWce4Rg13knxVkp9/4p7zyLQPGZ1Mx8xc6ceYIdutOPnrLSLyvMJ1pYO91SOk/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIRXhngM7+NtanNDIowt20P0Nrh0EHb2bTeBnAG1//E=;
 b=o1scKBWwuy3sahR8VcYNo1PuGQnVDoDttKNI2vHnZLMZ8FdxZ1279XWFx+s6Y6fvvAJDn6Kpe5Jf1z74GBPKtOmzAvTl/SI3KbagyVPOEbKYqGtAlxE7F53B92Oi8/ld2pNVLZ//pUo5OMt5MfCm6k1hW6V8g6oelZ59/p8kFKWCZEAUTAh7GTnp0wVhsR1UbGzIkYSzH1vLAtUqN5IaLiXjmwOibWLf0zRPiRsq0F+hYdkfsfqCQx7zi0FGDhdd8Tn9fraTtjB/X7fN9ZwWLqj3omlDrpSXq2zph5fc3N052NW7kqFTNrX+XWyVZWiGdWvko9awsGPHEmm8UqZx6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bIRXhngM7+NtanNDIowt20P0Nrh0EHb2bTeBnAG1//E=;
 b=Avs3lscgp9KAY6nfAe5EX63RiROX70qvCuD1qmmvvhYMOy4iKF6yYHStSNCySiX0LQwnHW2RVY81CDy0n0RvSYIY8k9AsLyAugS6Tg3xlhKQltT5LP11bFpopPGVX7R5iWO8T9XTK1o1CIql3OcSykbqpbeOeChkn+IMzjZYWfI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DU6PR04MB11208.eurprd04.prod.outlook.com (2603:10a6:10:5c3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 12:53:01 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 12:53:00 +0000
Message-ID: <808a63f9-77c1-4d61-8856-87277af3b894@cherry.de>
Date: Tue, 24 Feb 2026 13:52:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v4 1/3] use a venv for installing packages with pip
To: Antonin Godard <antonin.godard@bootlin.com>, foss@0leil.net,
 docs@lists.yoctoproject.org
References: <20260216-fix-make-multi-target-v4-0-749e588cb7f5@cherry.de>
 <20260216-fix-make-multi-target-v4-1-749e588cb7f5@cherry.de>
 <DGHXUDE510VH.1JG9S6P90SNTG@bootlin.com>
 <e41bdc41-be0f-4c85-bcbd-e00b10433336@cherry.de>
 <DGN1TVXRNHW7.2TYSX3YXZYQB5@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DGN1TVXRNHW7.2TYSX3YXZYQB5@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR5P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::18) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DU6PR04MB11208:EE_
X-MS-Office365-Filtering-Correlation-Id: ba701df7-c5a4-4200-679c-08de73a3a439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FOx0FB2Xy4aEiEQebcPhzv7BezLlekO/OEesLaDlDc8vxfdmsNGgP2EmAbsp?=
 =?us-ascii?Q?aokduDyxS7zvM36fi2H/DCq5rLAPVUUuvbz1O5jYSt6bRS9rBged37uFcUf2?=
 =?us-ascii?Q?UukIPADf1K1FZditslEXnU1IWNMoEowEA0h33i92AZw2FX9ksm8HK+NMPvnm?=
 =?us-ascii?Q?00urG0aRr0B4kgbtb7DRXdrgKML5Rz9G2tgLzfyUvdyj+lO2inDg5Z0OjBs5?=
 =?us-ascii?Q?/HnKPOf2P/Fa+2RlpGwgyUFSb2I3Mkp/T6rGm0otlu8ghHRGFgT+IjcoqIyU?=
 =?us-ascii?Q?VTFre609YIk23S0VEF4IqRRkTPIV1b+Jx32d5UvAhnj3bWcS0HkFYTFZ0Xoe?=
 =?us-ascii?Q?nIFCOH3cbW+LD18agjaTauPEEFKSf5f++BJIuWnwvkVixgzMhXBDpTDNJPyy?=
 =?us-ascii?Q?ouLzxjbbG2rFIdjlKRCZcC7aWh94A2sAiu+y66wckeeCKsspyI+OG1QYEV9p?=
 =?us-ascii?Q?Lr+Wq8kFuKz3/b2N3LfMSO7mN+/8zlPEzsF0pQgVc4VrCKDCbOy3WDpaSvDq?=
 =?us-ascii?Q?FWoIVcYSx04LYk8UpkOlpiKLSFllbXZ/FXCYPueVWiC3QqGxyfcV6Q6dmWmh?=
 =?us-ascii?Q?lX4usJzkovUs2krLkZDTQhg2Mh47dcDVKM9ggGtOkBrpoVQqGcfTl46mMgYM?=
 =?us-ascii?Q?dJ0uTj7vjM5sB4ALbzW+wQ23kNjr2uhmiSAfNUTfWhxnY07WpUfyw7QDGHXa?=
 =?us-ascii?Q?ysqEwCR3odzWqL/ptNLHIkzBrv7wa+nDRmpLXS8drdy5ZT7D9r0SoMDym+fY?=
 =?us-ascii?Q?juaqGyeND3VTqNdDw9G+pla9Lha1SOedQXTFiKeMrREBFqMP+dQ3vxnl7yBm?=
 =?us-ascii?Q?X8ITAX3kCNV403iAJs1pZl80JETEmUdGXOOw9uBsqR8GVcvN3OgJWdLvOk1b?=
 =?us-ascii?Q?bFQNqnO5VNpp2rMNPmEbFDInawyy/5721OcKr8NheaZ3lINkIqZmSGZVo72v?=
 =?us-ascii?Q?JGUjdjN4A9eZ0U3+2ItahL0Mr4sToOBEn2DpbE1TC6gm3ntqkErr9Paahe9C?=
 =?us-ascii?Q?nXqvYaI2AZIFsNVgD1a4aAo0MIbSDFeUR06xAyYZL13W9Hc4BjyWVPh20rnK?=
 =?us-ascii?Q?4+G4i7Tx8XaYS9f5jYpSq+4Ly7vThH0/GFy3E1acZ9fd5NwSdfG3FuId1jOl?=
 =?us-ascii?Q?Q3qFf0h83dzmJWmGpz0own3OcMKy9xSxHan1txIghgFwFh6SEv1GI8bS0Iv9?=
 =?us-ascii?Q?ymDFzoCrQXTiCVhzqUD2/uWnaEF1DROoQqqn2AD8BOSkKwlEIoqfTxVhGaTx?=
 =?us-ascii?Q?B0Wt6+rR3gW2+7Cy8sDz/unCHsZb25D08oIl1Py+B2xO2D/bEZrJo8FZUTVL?=
 =?us-ascii?Q?Zbr0lgaZ3OqdDW300h3LO+KxNivzR5f8Lcj6DTo4uX8R5sBApN/TonpftPaF?=
 =?us-ascii?Q?JQapj3YsOxs2HGqF+gRHFigmmF0ssw5XdX36tT0aYwTYzHRJRCfJToIFJRmy?=
 =?us-ascii?Q?eZowKEVW6wOJQ8Wsq8x2YFTusAaAgeheHthUxRENOpyFp1BGov9XUmDWWpjh?=
 =?us-ascii?Q?ycHPQFU4KCyJ1V1UrhL4kGA4VvdbVLdJh6ye?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?y+fD7jwZUK2Gb1tfi/FBGLwuyFXhn6Sq5W6zMZkTJiqBQAgF1crtjjXiONwu?=
 =?us-ascii?Q?8VMJa7Wxv7GErUw0S+4nTW1StmrpVTs/mTn+myDRQnWUc+lxfbEm0GYDVUcL?=
 =?us-ascii?Q?97au9yQw+fHh55fNcgsDLZwY9Tg14BWGG82FU/WkH+4ayhb3e6+r783X39ah?=
 =?us-ascii?Q?G8XmkkW9bjTO8EwzI+KmU/HEIIIJdqner05oFMioDxG+dsmDt3U2IEA18Ib2?=
 =?us-ascii?Q?ZRGdkqGz5FN2QsYpcAQWOegDeFMNOb7l411k6vP+a8a9oSAN4ctLvoEb/Z+1?=
 =?us-ascii?Q?bcqcUXvJO6Rj5MdwbBtU1OpamDt9YiS2CII9NzCRL4Eh5zQFeojRGNuZn2jB?=
 =?us-ascii?Q?rtWwk6RLMrrehtHEccPf7/GN4ev48gqjkFQ6rea9vaPZS1Nl5PTLNlrDow01?=
 =?us-ascii?Q?Z+Cj6nvGCADtzPfog4qSQXuQpWrmQ/Xnz7ft8jc4UidSKDobtCRTRQ/ymmqX?=
 =?us-ascii?Q?U18QQzbgjxd/538hrG3Rrx3R4dPL0x7Hc8dBifRhmynpWXbiuA8Kr309T1Op?=
 =?us-ascii?Q?atzZp9btP6nEIWBYssJKl7l9IqzbBPMonu+aX6ZMXJKsMjomwM+NbFwVeMDR?=
 =?us-ascii?Q?yGGiW8sXVp5zVrNIwvdCp0yDIZ5Bt2+BbjgSGlliwyxFbKwu+DO3btP6Uyyn?=
 =?us-ascii?Q?gBnMvm1HuMLFyPrArr8TnNoofQ0cRP1JuI5m1Kvwkrqmwqtv2kO3oG44fbIY?=
 =?us-ascii?Q?b6gIHEt7yDYvI0zU4NWIjcvMpjrnJmWqxqqUQA3/S0O4SdkObiUWh2tmT+tb?=
 =?us-ascii?Q?Gwc3I/1otrrpBU12avm/OiY9/bdBeElcEsR+4tEUDRhIEQFEDxatyOvwiOuL?=
 =?us-ascii?Q?gefa/bDRxD4h8bbuA7/JJuCfEDiLOL1kRKQ0ywG53LPsIJr7yDdiVlZrflsa?=
 =?us-ascii?Q?VbDsYtY5QLL9aePbjeHOellG/CLFH7QXh00z0wPxw+42wdM2M3WO0eNnBNsp?=
 =?us-ascii?Q?TInERkuyroYOmqayKkhTweCPhrDXAnnsHaUs1HZ4Qo9QkLEwqYw05Eyq120B?=
 =?us-ascii?Q?g6qiS3kw4JN8jlXenmKkpogo8GGb/H1ZuxbJzQ+sK7k6xl0d1KWnKKaSuxsS?=
 =?us-ascii?Q?QUkukby4d+dK9A7crPjDC8bN2xX4/ayjvWHOejCzo009vZNQ55D+DWLX7XeR?=
 =?us-ascii?Q?ziqDu3fY1Fxzq4Rbidk4pCiFWKxMmkcK7dkF7TkNs+D0V5xqc89ew1RSPygs?=
 =?us-ascii?Q?V4tf7Tv5N/uG5qzh0+QcwLR55G8RctxUxYc3nPfMLmGAkG6lJgnBC5Y+CzLL?=
 =?us-ascii?Q?nH77b9Vx9VSNFbwMLC0+U0ZttbWqWLqShjay+4X8K/z/jUuSrXsWGg/HiRyH?=
 =?us-ascii?Q?oSVqdfWt0Ta0GO9sjuwxvQupHxl/p4jPqqTlV0BBgpm/SO4iYVGgA8NBeSjT?=
 =?us-ascii?Q?LPc1feO8vi+LwFVAG0oBKRcmz9llX6yLjRo3/qQI1O82sjg/nwBWV8X8MYPI?=
 =?us-ascii?Q?OJbUq1PWOXU2VIeWZl/7wGwALY7kF/PA/PWqE1d8PatjX5hGmSdsW4TqZtCt?=
 =?us-ascii?Q?mZAfANwB9shK2AAGH15ETLqOSNCQUhV6wGxG3qa5V0w31X3Daz7Z0YZK3+g3?=
 =?us-ascii?Q?H/dwPGIOZRRhx9ElXiueuEpv3V63HVFsp5GrDt6+Ja3lsnqjHMbtk+RV7ezT?=
 =?us-ascii?Q?YN/0A7ch3UMdeYF7cbOCRcL1Nn2kAbKR2pqvdBWzP5o8Hn37BW7KiOTPgpZ2?=
 =?us-ascii?Q?doRcMtb4nRWf4F8C5rT8VbHy6gQcnvEHsD7J4fa+vFoeT9tK29Rg7H30Ncdm?=
 =?us-ascii?Q?NHIP7DvNmSLRaZoTt1slE8C5XmXCfYdYdkJqb5/B1oWqqynH1ygN?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ba701df7-c5a4-4200-679c-08de73a3a439
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 12:53:00.6741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGShE84/F0zMqWslkNCymoYtI76X02ILe2VOm7BUqQGF+xsn57gFzGpGrmbrJwSOqI+kDAEDu9mP2aXU49Z2PcnsB5IaEcRM/+91W02u10g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11208
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Feb 2026 12:53:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8968

Hi Antonin,

On 2/24/26 9:28 AM, Antonin Godard wrote:
> Hi,
>=20
> On Mon Feb 23, 2026 at 6:33 PM CET, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 2/18/26 9:18 AM, Antonin Godard wrote:
>>> Hi,
>>>
>>> On Mon Feb 16, 2026 at 12:26 PM CET, Quentin Schulz via lists.yoctoproj=
ect.org wrote:
>>> [...]
>>>> diff --git a/documentation/tools/host_packages_scripts/pip3_docs.sh b/=
documentation/tools/host_packages_scripts/pip3_docs.sh
>>>> index 907ecec55..9aa7f16fb 100644
>>>> --- a/documentation/tools/host_packages_scripts/pip3_docs.sh
>>>> +++ b/documentation/tools/host_packages_scripts/pip3_docs.sh
>>>> @@ -1 +1,3 @@
>>>> -sudo pip3 install sphinx sphinx_rtd_theme pyyaml sphinx-copybutton
>>>> +python3 -m venv --clear --system-site-packages /tmp/yocto-venv
>>>
>>> I find /tmp a bit odd for installing a virtual environment (at least, f=
rom a
>>> user perspective, as I can understand why you did this for the containe=
r).
>>>
>>> Maybe you can add a comment above this line saying:
>>>
>>> # change "/tmp/yocto-venv" to "./yocto-venv" if you want a persistent v=
irtual environment
>>>
>>> ?
>>>
>>
>> I can do yet another sed in Containerfile to avoid telling the user to
>> do that and just have the path different in the container (see what we
>> do for zypper install commands). I tried mounting the volume
>> (yocto-docs) as an overlay within the container (:O in podman) but that
>=20
> You mean yocto-venv?
>=20

No, I meant yocto-docs git repo.

The venv is within the container rootfs (set up as part of the=20
Containerfile instructions).

We mount the yocto-docs repo into /docs in the container with a volume=20
mount, see the declaration of args_run array in tools/build-docs-container.

We need to have a way to have the container /docs (where yocto-docs-venv=20
venv is) overlayed by a volume mount such that the yocto-docs git repo=20
and the venv appear in /docs within the container. I am not sure this is=20
possible (at least, my short experiment with :O in volume mount=20
option[1] didn't succeed. I think this is rather used as "make the=20
content added by the container runtime overlay the volume mount from the=20
host such that when you exits the container the overlayed stuff is=20
removed". It seems you can tell podman to use a different upperdir and=20
workdir but my understanding is that this is for storing the overlayed=20
stuff outside of the container such that it persists for later container=20
runtimes).

[1]=20
https://docs.podman.io/en/latest/markdown/podman-run.1.html#volume-v-source=
-volume-host-dir-container-dir-options=20
Overlay Volume Mounts

>> didn't work, so we have to have the venv outside of the mounting point.
>=20
> Sure, I guess it's best if we can show the user the proper way of setting=
 things
> up while doing it our way.
>=20
>>> Also maybe, s/yocto-venv/yocto-docs-venv/?
>>>
>>
>> I was about to interject that because we use --system-site-packages, we
>> could still run bitbake from within the venv and thus renaming it is
>> unnecessary, but then I tried building the docs locally on my f43 system
>> and this series doesn't actually work.
>>
>> It complains about not being able to find sphinxcontrib.rsvgconverter
>> plugin while it definitely is installed!
>>
>> Then I remembered having a somewhat similar issue in my Python
>> pet-project when I had the same package installed twice, once
>> system-wide and once in a venv... Turns out that a package which
>> installs a command/script doesn't seem to work with venv (at least with
>> my sample pool of... 2). It would always use the system's when using the
>> command (and it'd be fine with python3 -m <package> as far as I remember=
).
>> sphinx-build actually is a script, c.f.
>> https://github.com/sphinx-doc/sphinx/blob/master/pyproject.toml#L99. So
>> when our Makefile calls sphinx-build, it may very well be calling the
>> system package if there's one and not the command for the sphinx within
>> the venv. This results in not being able to find the modules installed
>> in the venv (that is, sphinxcontrib.rsvgconverter). But Quentin, you
>> would say, simply replace sphinx-build with python3 -m sphinx and all
>> shall be well! Now the sphinx Python module used is indeed the one from
>> the venv, but it cannot find the system modules anymore. If anyone has
>> any idea what's going on, let me know but I don't think I'll investigate
>> this further.
>>
>> Instead, I'll NOT pass --system-site-packages to venv such that we only
>> have packages from PyPI (which means, not being able to run BitBake from
>> that venv). Now... this still doesn't resolve the issue of sphinx-build
>> calling the module from the system if it exists...
>=20
> I did some tests:
>=20
> =E2=9E=9C  ~ mktemp -d
> /tmp/tmp.M4eSbciQhZ
> =E2=9E=9C  ~ cd /tmp/tmp.M4eSbciQhZ
> =E2=9E=9C  which sphinx-build
> /usr/bin/sphinx-build
> =E2=9E=9C  python -m venv .venv
> =E2=9E=9C  source .venv/bin/activate
> =E2=9E=9C  pip install sphinx >/dev/null
> =E2=9E=9C  which sphinx-build
> /usr/bin/sphinx-build
>=20
> Maybe you're also hitting this. Now after running:
>=20
Nope, works perfectly fine on my side. Returns what it should, that is,=20
sphinx-build from the venv. However, *running* the command (e.g.=20
sphinx-build --version) shows it's using the host system's and not venv's.

> =E2=9E=9C  rehash

hash -r is run as part of the activate script of the venv when sourced=20
(see last line in the script). I'm assuming this is similar to zsh's=20
rehash since this script is compatible with zsh and bash[2].

I'm assuming the issue is we need to run it again after installing=20
packages through pip...

Another option is to source the venv activate script again after having=20
run pip commands. Or run pip without having sourced that activate=20
script, e.g. like

python3 -m venv --clear --system-site-packages ./yocto-docs-venv/
./yocto-docs-venv/bin/python3 -m pip install xxx
. ./yocto-docs-venv/bin/activate

or

python3 -m venv --clear --system-site-packages ./yocto-docs-venv/
. ./yocto-docs-venv/bin/activate
python3 -m pip install xxx
. ./yocto-docs-venv/bin/activate

or we use python3 -m sphinx in Makefile. What would you prefer?

[2] https://docs.python.org/3/library/venv.html#how-venvs-work

> =E2=9E=9C  which sphinx-build
> /tmp/tmp.M4eSbciQhZ/.venv/bin/sphinx-build
>=20
> Looks like it's working now. rehash seems specific to zsh in my case, bas=
h does
> not know this command. But bash does not need to rehash, it works out of =
the box
> for me with bash.
>=20

I bet it doesn't if you don't run rehash. Can you run sphinx-build=20
--version, python3 -m sphinx --version and python3 -m pip list | grep=20
Sphinx?

For me, the former returns the same version inside and outside the venv,=20
that is, the host system's version. The second returns what's inside the=20
venv, as reported by the latter.

So... I researched this a bit more and I think I may have an idea what's=20
happening. sphinxcontrib is a namespace package. Many packages install=20
in that namespace, e.g. sphinxcontrib-jquery but also=20
sphinxcontrib-svg2pdfconverter, you know the package I'm trying to add=20
in this series as a dependency?

See=20
https://packaging.python.org/en/latest/guides/packaging-namespace-packages/=
#native-namespace-packages=20
for how to create native namespace packages.

And you know what namespace supports? Different locations per "portion"=20
of the namespace, see=20
https://peps.python.org/pep-0420/#differences-between-namespace-packages-an=
d-regular-packages.=20
This means you can import sphinxcontrib packages from different=20
locations (host system's or venv, if you use --system-site-package for=20
python3 -m venv). And you know what's important for regular packages=20
that are portions of a namespace? To not break the namespace package,=20
that is, NOT have a sphinxcontrib/__init__.py file... Which, lo and=20
behold, seems to be what sphinxcontrib-svg2pdfconverter is doing. I'm=20
assuming because it is NOT using the sphinxcontrib namespace package,=20
but defining a regular package sphinxcontrib with multiple modules. This=20
means that importing sphinxcontrib when you have=20
sphinxcontrib-svg2pdfconverter anywhere in your host system or venv=20
environment, you break multi-location support for packages in the=20
namespace. Why this didn't break more than simply not being able to use=20
multi-location support is beyond my understanding.

To check paths checked by the NamespaceLoader[3], you can create a venv=20
with --system-site-packages, then after sourcing the venv activate=20
script, run

python3 -c 'import sphinxcontrib; print(sphinxcontrib.__path__)'

It'll print a few paths that will be looked up when doing an

import sphinxcontrib.something

Now install sphinxcontrib-svg2pdfconverter and run the same command and=20
you get only one path.

So... I'll be working on fixing sphinxcontrib-svg2pdfconverter and=20
hopefully we don't have to wait too long for a v2.0.1 (or whatever the=20
next version will be). This means we'll be able to use=20
--system-site-packages again, which I think is neat.

[3]=20
https://docs.python.org/3/library/importlib.html#importlib.machinery.Namesp=
aceLoader

>> So I plan to change sphinx-build to python3 -m sphinx in our Makefile to
>> work-around that. Any objection? Did I miss something or get something w=
rong
>> maybe?
>=20
> I thought of doing:
>=20
> diff --git a/documentation/tools/containerfiles/Containerfile.apt b/docum=
entation/tools/containerfiles/Containerfile.apt
> index a573786f0..0861354fb 100644
> --- a/documentation/tools/containerfiles/Containerfile.apt
> +++ b/documentation/tools/containerfiles/Containerfile.apt
> @@ -17,9 +17,9 @@ COPY --chmod=3D777 ${DOCS_PDF} /temp/host_packages_docs=
_pdf.sh
>   RUN ln -fs "/usr/share/zoneinfo/$TZ" /etc/localtime \
>    && apt-get update \
>    && apt-get install -y sudo \
> - && if [ "$INCLUDE_ESSENTIAL_PACKAGES" =3D "1" ]; then yes | /temp/host_=
packages_essential.sh; fi \
> - && yes | /temp/host_packages_docs.sh \
> - && yes | /temp/host_packages_docs_pdf.sh \
> + && if [ "$INCLUDE_ESSENTIAL_PACKAGES" =3D "1" ]; then yes | bash /temp/=
host_packages_essential.sh; fi \
> + && yes | bash /temp/host_packages_docs.sh \
> + && yes | bash /temp/host_packages_docs_pdf.sh \
>    && apt-get --yes autoremove \
>    && apt-get clean \
>    && rm -rf /temp
>=20

What does this help with exactly?

> Or add a shebang to the snippets=E2=80=A6 but that makes them non "copy-p=
asteable".
>=20

Why not, it's just a regular comment when pasted into the CLI?

Cheers,
Quentin

