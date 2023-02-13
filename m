Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7AD5C636D4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 09:20:16 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.87])
 by mx.groups.io with SMTP id smtpd.web10.10507.1676280006572771381
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Feb 2023 01:20:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=ZouSIhQ3;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.87, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMYkeyZ8K19ru0hghJE6cXaJ0rBS+1jHWzyTr5eGwUtH7NsfSD7P6WVs2xNP8ItCunX/tEkGoxHbk0N6UrpnYC7eA0TU3h7KUHctzcV8AB9Y1+rd7uEoLejETZmnb08bXgPZOuchCRDnpVYjq5+bdORPtT8P369Z8/kb/WXviveCrqMq68zzVhAFYwvH//is7hbo6NH2Zdy5VUsGo0d93fpAyFKCnBxoloFLIilsTS4Q1ILdF7UQ0Fc39n+krtGhDShme8AFENIG9TO07JFU0afMbb69Q6uUL6LULz2hdZef8xYb8dgBRuPPXbcesPz9w4cHABgkENRCFknu6kVxMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4ZY0ERGhKr1gssAB1+yhyA90Jjnki7Rtv+DNYJ0J4w=;
 b=LFme8EMqmF5lmd1MeDGJTnYTKCX7NRTI0Cmh5kiww9ETIn+GvcfHqNxA/3MD2o1qiw50H50PNbT2HCF2XmFCznTTO7dZmyhGryx5vUkl0sr1XvDLXGCfkq3wyr+qKMb6u5ZqLx8pWiouDTfuPjyc5dn/EoidKmwMg6iHsKZyWbsbB1W4FxuVVY97VnzeKeYnAm0WiXusrydAGcOguV+IO4HH/kY47/EqkKkVso6R3qk2k/c6Pyk+b41qT/8P/N8AwRVIc5L0LRE/uoHU1o4FqwFnXCrWAyu8QrOIYdDBOYJSk5CEt9rnXUCA85Wb0YnrRnLH4vBbdPVkoRCcVj5EsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4ZY0ERGhKr1gssAB1+yhyA90Jjnki7Rtv+DNYJ0J4w=;
 b=ZouSIhQ3PXUNvNcE5t8dLOBFfXiK3a6+plOJ4BMJpDHmDD89BXRE6gWrRNXN2cmASIffjRlrLsO+LVuYtDrN8kjylsCakut91vxk+pogHV+TM53gnwZfAAmC83ea3VUFJ3gNHZPQBvkzTcbwLnzYeg1WZhZ0L2Z0A2Lumnsy/KLJtB44PP6ZJKt3ZeoN1UpVlmyoKuliz/SCIKngUN+HaRdIklUOYm7Mw+2E7AdEoxUUzjzzeLGlEZtOsgr0TsamUBl7r7fpMi78Gi1Q41R3xTMscei75eCZaFgIArHzGuRQwzT+G5T4hK/Hln4D+TPERgY5/2KatqENdhAwoilWBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM0PR04MB7170.eurprd04.prod.outlook.com (2603:10a6:208:191::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 09:20:03 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd%7]) with mapi id 15.20.6086.023; Mon, 13 Feb 2023
 09:20:03 +0000
Message-ID: <35ac75ed-1888-47f8-907f-5f7d8718758a@theobroma-systems.com>
Date: Mon, 13 Feb 2023 10:19:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [docs] [PATCH] ref-manual: add missing quotes
To: =?UTF-8?Q?Ulrich_=c3=96lmann?= <u.oelmann@pengutronix.de>,
 docs@lists.yoctoproject.org
References: <174331ACAD9BF3F3.21535@lists.yoctoproject.org>
 <6r7cwmpmot.fsf@pengutronix.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <6r7cwmpmot.fsf@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR0901CA0098.eurprd09.prod.outlook.com
 (2603:10a6:800:7e::24) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM0PR04MB7170:EE_
X-MS-Office365-Filtering-Correlation-Id: 84dee1a2-e079-4de8-3826-08db0da37cdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CSB84IMH35Q/FvWVBS8/67RByrH33PUkMyaLt2aOvMM7hdNnUIZZonh/f5dAPD2+AP3DBpKVIy+bsR/sq9pbMAwFJMUbmbAADSspzyx349fXTL1QB02eWok0PkKGoqbafGhdHrtQxcM7NNJXbYFYkT2/2KXfR3OxGDJlMXoIkPe49U2mSUd/+uKgXyWGvTOZRG6pgsI+XtMs7L6fl2snBgen9A8t8A0dqPm9cNvuf8W8o27UfuqsX5nztuAuOZsHCmUw/Fn6wsgM8i5BVhiuu+en14UMFBwmhA327QBi4fJHxcSFJnWajAm7ykfbQR/UpXQHYWrRjJwzIL0IFtttrFNI39PNwCc4PZc7dUN9uV0QGReHpPh5juiEMBJjFzddzbAFZn+aub0SiRzgbq/QrlHGyE7mIVAvUTiwTFCmloEQlGXADMVZ0VeutdoS5/5jLEi2ywIofWIM1X7wvOHW/b7pC3IsP0SUnLTY1RQAqC33Xwlp84yMfIN4elP/iS/MXBSk4lQEkp1dKasb1AEaFKMiYUqWVGbcmy79lcFXemGDMkV+J4Wl8SP7ydNGdmZR0nZn/M0bgC3xBwtZYOHUBCX2aD9y8jN3Zb5cnHDzqtoh/fQHvhYnZ0gXt4GMIjfZdFiSN0s4zgAXNrvGz0quUyZ8PltzJolmm3mfVRFKjd6lBW1mvrwCvqiDAmlcbuoVqr7kdBuhZxsGgNEIJ9Gn5WnK+ZXSVNYFIv3h4xxilrQ/hYa/vpmGGSONrsGOGyXgKmtI2NpxBpz1Gt3ZVGSbsA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(136003)(396003)(366004)(346002)(376002)(451199018)(31686004)(8676002)(66946007)(966005)(316002)(86362001)(31696002)(36756003)(186003)(6512007)(6506007)(2616005)(53546011)(38100700002)(83380400001)(66574015)(44832011)(41300700001)(66476007)(6486002)(478600001)(6666004)(2906002)(66556008)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/T4TLIyViyDvHajeg1X4Sznm3Zwh8f7KXqfBngSjRTuOclt+yp0weN4XYXCq?=
 =?us-ascii?Q?jzWj96C9WPhpUM4GL2DyUE+pCD1BMnpM47j+MW1ByqAFJlxrhFtsS17+XbPO?=
 =?us-ascii?Q?seVOdlN29GQ7AsoVKaOUpO2tLg5B/hP+5nyDMyD0b68AD/lMjabljrT24FIu?=
 =?us-ascii?Q?kF4tijqk/BErJ3tFzp9Kh6isF8ahGxcS/d7b2nfSNHSt49EjcgXE7JL8XGPy?=
 =?us-ascii?Q?GcPRTiyvU3GijvocN5wi7Kn+QNG4cTEc4S36BRgkMkEtxdjYeENo5mPIocx6?=
 =?us-ascii?Q?QndkGF44bKm37MGVkxeZ066IwSVC7LuMrElpV1Vk4CKbfXgwEsS5HLFW2xrW?=
 =?us-ascii?Q?F4pRQysuwlC0Tbs06Z3cHCbuiwDFGIEnX3RkWkmkTwjiBDy5eHWz6Em5QL5G?=
 =?us-ascii?Q?sMH+EGTx6WVA6HNWMRBnHBEEyZTyI26NtteJtAgv/Goi36aaSDcRqu5ykP9+?=
 =?us-ascii?Q?veyU8D6fTDGG3+z8yu75Djc85ALxasvuaE+vnNg1uSm/BnKhUT0JaHl5TBYt?=
 =?us-ascii?Q?EkhTwOc3s0BBBd5CR7pgrr7ISGb1GSmjX1t3B+Ja3mmQfgYDZPOWJkWGu+My?=
 =?us-ascii?Q?DYEvUIhgnhib9/e9a/69zlK1WGFmdOpSW7/5VClmLvcmMq8nYWZ0PBIGHpgJ?=
 =?us-ascii?Q?o5KHspHm9lIrD781t6o8XVaLNlFDaUv6SwdxaWxLY1CaAlzOCVjnhfvZqfj/?=
 =?us-ascii?Q?fSSrqE1krnz20dXL9bw9BI9lpfhALeiTE00M23fqCECY7R4lGk48POoJUs57?=
 =?us-ascii?Q?L8iCK2Xic/s/O0hKXtPXfD0jEBlNDRF4uWWv+GkCp/e6q8paIHzrZ0sNWp9r?=
 =?us-ascii?Q?7Y6feKSxXXrGRCgM4yB16wu0XAX5QePJWEDfkfWf4ZozDlM4OEEgk/MYsF+8?=
 =?us-ascii?Q?VE9lx1bcpJcNKuOtQs/VxlohaOECdxweN0rVij8/dBfFgjt36UY4dTfAWY4y?=
 =?us-ascii?Q?LtdDaVarNhWnnnRPrtXDqTFZGwocNbXTMh36RqQFrSBWFZZXqJlS2t+J+6Fs?=
 =?us-ascii?Q?8ljQaZd9LOsxWjQR5PNu7ZecvFkejV7oyQ7LNWY1/UuBXo7Gj9/prU5sxvZz?=
 =?us-ascii?Q?UcD2lXNbbz7aZwZ+ZykU8jsol8pIkiubM5e5YBtRru6gNx5QRXfOeFLdMxx8?=
 =?us-ascii?Q?ahAGHNRnqjRB4OgpudMWVPFcsLLeEipS0P2gqBg5/HyNN46eQddj87BY/wMw?=
 =?us-ascii?Q?tHHrcnXLUctjm87GowHAgcGE1ViIye+3+HXGDEF76IR7wuSVpJ8dGArekl0y?=
 =?us-ascii?Q?uYT+woD7jlMOvknkyslkZaueqfRlGQnjg8LzkG+r147urGRxLEKSR54xfysY?=
 =?us-ascii?Q?FwyXfwwQxD7eolP/3QFNTAh/I3s6Fs7XjvpKzN3K7EilZYHItsFrC9IHahdn?=
 =?us-ascii?Q?2DncUfPo2ifjgtUCmUBL5IoGqetZ2J4QClbN7MZwdo5D5Ad0ZnTDcXGCFFdW?=
 =?us-ascii?Q?gvRYQxKznH5YHn8o9svbxfhBdfgLggsGGK2vsTIxXFrEbJjDKehA1AcbVsA9?=
 =?us-ascii?Q?YQcBKWaIPdKl1ULq/1q1SgVJ7H21y3f4MER9HlSYbHkRDkIz3fA3M5hv5Ham?=
 =?us-ascii?Q?dFWlNVR1DRzeeaZKPyUUsZ1iVoSKVN21hSGzV4gG37Dv3KQg2oRV+VzzxOjD?=
 =?us-ascii?Q?ymFA5qDhZUfdYiM3arlALV65jqwEBkjkDmXjsXz0hc2SofuGjZYQglaImxaw?=
 =?us-ascii?Q?WhMd3g=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84dee1a2-e079-4de8-3826-08db0da37cdc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 09:20:02.9944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYGU+NYjGzQhoV/jd4SBgC9LA/C7AJ1MFFfTelp2wRZAnlrQCMX5Gfz/+Ev1GKBwuPMr5kxOr5HECiqtMhhrc47ysc9xiCCCkgNtAADiN4ByJwe4Re4Z94f6BGAvuteX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7170
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Feb 2023 09:20:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3668

Hi Ulrich,

On 2/12/23 22:45, Ulrich =C3=96lmann wrote:
> Hi there,
>=20
> On Sun, Feb 12 2023 at 22:41 +0100, Ulrich =C3=96lmann <u.oelmann@pengutr=
onix.de> wrote:
>> Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
>> ---
>>   documentation/ref-manual/variables.rst | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-=
manual/variables.rst
>> index a36c4c6df962..c561aae6563a 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -4275,7 +4275,7 @@ system and gives an overview of their function and=
 contents.
>>         To use the variable, set it in the append file for your kernel r=
ecipe
>>         using the following form::
>>
>> -         KBUILD_DEFCONFIG_KMACHINE ?=3D defconfig_file
>> +         KBUILD_DEFCONFIG_KMACHINE ?=3D "defconfig_file"
>=20
> I did not find any occurance of a variable named "KBUILD_DEFCONFIG_
> KMACHINE" in kernel-yocto.bbclass and from the above line's context my
> feeling is that the last underscore was meant to be the old override
> syntax which should be updated to ":" now.

That seems about right:=20
https://git.yoctoproject.org/poky/commit/?id=3Dc801d0425d442d05245274e71e7c=
cc9ff9f81915



> If this is correct then I
> would additionally expect the override not to be KMACHINE but MACHINE
> instead as only the latter is a valid override. Could someone with more
> insight please confirm or reject my suspicion?
>=20

That seems about right too from my 5min of reading kernel-yocto.bbclass=20
and also the examples that follow this "mistake" in the docs:
"""
Here is an example from a =E2=80=9Craspberrypi2=E2=80=9D KMACHINE build tha=
t uses a=20
defconfig file named =E2=80=9Cbcm2709_defconfig=E2=80=9D:

KBUILD_DEFCONFIG:raspberrypi2 =3D "bcm2709_defconfig"
"""

and I actually believe this should be saying
"""
Here is an example from a =E2=80=9Craspberrypi2=E2=80=9D :term:`MACHINE` bu=
ild that uses=20
a defconfig file named =E2=80=9Cbcm2709_defconfig:
"""

> In case of positive feedback I would gladly send another patch doing a
>=20
>    s/KBUILD_DEFCONFIG_KMACHINE/KBUILD_DEFCONFIG:MACHINE/
>=20
> that changes both occurances in ref-manual/variables.rst and kernel-dev/
> common.rst.
>=20

Yes please :)

Nice catch!

Cheers,
Quentin

