Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 848C5EA3C59
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 11:33:02 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.129703.1775734381621596358
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Apr 2026 04:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=ApQVhWBI;
 spf=pass (domain: cherry.de, ip: 52.101.70.61, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QA5NGzg75to+8ZA/m6kYpZv6kLauS0/1mBXqoXkC6K79lhti6yTih02cNWMpFqh/QPj7+J6T7XiOE8v8xiye9S+83IMkAihUJR9dy754wMSTBYU6OCvD3MzeZebHwNslN60KdlGkiGaOy5rk0cuuktEFuLt2p2jFQcThIWaraFADXqkvbhiuyZ2pQeSpUmbm1XF2XQVICUGE6R3k7HQyXF2Rur6EszBVjrIDmul/28+ETlY3lfLYtTrGzFDMmlenTNRl4xyPHAepo/m2FaQJI3z5Gs0lesJ6XtzFf0kyAzx6RMWw7UhLjckSH2lpEEa4U4et0n/pTg/w04zdB29l4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OoNxiEMw3GOsp7biptavqoI/uBOh40oyFqqviTlaXH8=;
 b=ScTuRDNccc/Sw4LxSLFA9WMI8tmbz6BuGanWKYkDTcpo6EOwseUI0gVV/Yc5rTfb5U3+nV8dYx0tUTapwpJhk/iXCRyJEQzMeRLPqMlN8qmNZ4G+wGf1Lqm8I+yzunI8wzXLKMQCfZ582sjWOxBkW2paD9xs+V2B3XN3MEKfPb06Tkxk5gXpe7H0n2raajjQ+Rhesn1nx/hkra97QUAA7dI+/Vin+J8UNXLLvVaVvSBZUZgVOi8sK5xbpnxLuLkdRqpvJRiRX5l1OyZfP3/AJj9/AaGW+kfPkA7lJR0T/fo91K8JaaaTmrvpDEXE6AwAdBkdY5sAZcI/tNEy/iGgVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OoNxiEMw3GOsp7biptavqoI/uBOh40oyFqqviTlaXH8=;
 b=ApQVhWBIMbfGTFvAN//vt+uVsr3CQn/aCxMwDv2juMYuCPDITs2iQECuoe9uPboGQ6BQVkCZmPg3epcZTBmXKPE+oB8ngt9gCgHdyqgch0Nj6f5ivmn9KmuUrMgyxXu5rdNKGGSeNtmbIjibuPBaHOtPJVORMzxJzYVMZUcrRLY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by DB9PR04MB8218.eurprd04.prod.outlook.com (2603:10a6:10:24a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 11:32:57 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 11:32:56 +0000
Message-ID: <add0c98d-5caf-4841-aef0-07b98ac49742@cherry.de>
Date: Thu, 9 Apr 2026 13:32:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: fix wording in
 COMPATIBLE_MACHINE note
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>,
 docs@lists.yoctoproject.org
References: <20260409094035.346379-1-joaomarcos.costa@bootlin.com>
 <5ff51b37-613a-448d-949f-406a56f1a012@cherry.de>
 <7d76e296-5ec5-4dd2-8813-782b497a58a8@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <7d76e296-5ec5-4dd2-8813-782b497a58a8@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1P190CA0022.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::35) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|DB9PR04MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: 451aa474-cb8f-4030-9202-08de962bbef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	J12RDW/kAs+OfjzY43FKEdF4yWAObMtn1ERQyVCLmJemyuZcDXZxE73jKFdSQHBYuppE6ini4idtprQoWOrQVk9PD+sd+2NsZYLnJJSw4Ee0JRWu+jmjeJcb47vEDV8BtZkP33xBW/8MS2E4Qeg0rVqTKQiz8OJ6P3F5G4CSNIzRoIdsjPPGd1hPQqFAamoUS0QNqYSh+nybxTzOveH2dNDnD3pjGyjv+zuIKu7yC+EiVMXFUq9zen6xqrzb8LbfWMnBJ+UuET8hbRtSqEv4aZA5LPCwrErydDClcx8rQNJva1e57CbnFQlQ6sLWsEkU61lM8bsnYjaHZqZzIspy+djDxy4yaNMCpxBMXvJle7nEtvYh3Mx0xEgUVoYWA5qCvVGiWih6cv2UB9ZrZczRb6ugzBnH15CJzfPskoASmqIzXIaB/vWIuPrw1AwyAqWq4fLjZrFlY7InYHvReMkf7+3g9UqWZTKLytp6swddDbT2PldZ5hLtmamqrvAj7Kz0mb5OAoEPRa1KolUPzYjF/BGQTYvVvkJfREOVVElULK1j1eKu8DlWaDi1Rm2VyZxhN3CXWduIVSj1Maxsd8de4QOU79bUyqHLvNdhWyZkyI8cJ37w8Ifk+llzrznMfzEK2ykyF4P9yEBnSChR56G9B1VWnjUHHdruatgOyihHJjJ1XcDp551uZDjQHG2n7a8e
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wnOshtA0TIKIbPC/Oe5E01SIlQU2hTiym4vQQvJAy6d02UEO4Lw8ilLkLkl2?=
 =?us-ascii?Q?Lll0SbAGA4bOtHbIy5F/wdbsA5tpEUB7Zuw82D+IbeynpE45aNAq1mYPehjZ?=
 =?us-ascii?Q?HpHTIGO/MHiOewNeAcbeJR6u9iTrzoxf6oXe4EQ7+Pv8X7ccjymY8IoBc0gb?=
 =?us-ascii?Q?ciI6v+lVfBPEE9m1WNxx6BXRATlAg3kq3e5WpWAtU+k5aiWTZakcgCTfm1V2?=
 =?us-ascii?Q?czTQZsRycRNy7vFvkvGByHW30gdCY9wembUFB3y5A6Uzqgy17fPfv9glKwEz?=
 =?us-ascii?Q?qQ8Bo7IQS1J7V/bGRYUBPilZ/wpKIZ4o4JsnHuC5qE8vPdX3EHNAZws5TlWw?=
 =?us-ascii?Q?3nhhNvpRsbGhhqDsqQZ8BrEMPRsoyYlWenaCZRB76eo2bpeY1ip3hwma/TMP?=
 =?us-ascii?Q?Bw+jr4AZEQ//uzEVdHFnWHDo5hJOvgypKj19uEfidcbVay/8jdKb3lEqoE6B?=
 =?us-ascii?Q?lJtYOibWYXzurbSvSpxDryYz7Dv5xAm7uwJsQHB018LvMFqyzG+ds0yPGW8U?=
 =?us-ascii?Q?zbHDOqDHFgE0NFTnGwGpVx41gGW4Hw0xlKwh93sB2V8yly0iL1XDgGhU0E6S?=
 =?us-ascii?Q?GXGEuzPsdvyMj86fO35hVpzhjFn4OHzWO2ylmb7v1Ypsfol0bmlRglKlwN8Z?=
 =?us-ascii?Q?gs0qNktff2GPc7jN3M64Yc95zJcfUq+zQNeKtiA6T+SkD9poanZzDRBE04Rp?=
 =?us-ascii?Q?ypmyXqmlFTX7IkHoBC2gjb1UbcVddFWVUeclL0oX7RVo0ToiX2dLC33t83Yu?=
 =?us-ascii?Q?enUl57K0SFdo4v3et2+PS6j5gU3KXGr6Bw5Q9Kft3zX3IvkiyRcK64zCoimt?=
 =?us-ascii?Q?iQSLhf9PxYS71vpyGGo0vYn4R/VODJ5W4n5IXXka1EY3pLqMH5PfXg5LuVX5?=
 =?us-ascii?Q?5ydK8B8XGPHu9QS4arrYf9ZxTqTCYqY1SqEaUgVgCMupcKKAzS6fjcgPc4Zc?=
 =?us-ascii?Q?Eo9T86nUVHlLjTIt15WUaDSlVhy79X2S4Er6IUIXUdUG8wAW45l9OPMwqeu3?=
 =?us-ascii?Q?hVqRw521JABbrakV2tBZEHqsnhSnQ99lcFllbOV7GsUhrvfmP1JL3bzxidxA?=
 =?us-ascii?Q?B3oIqIpns/twBspVV9nmFo5nxJ6pqPE7Re57I7m1v+W2EM95PiD2u4CLaly3?=
 =?us-ascii?Q?tzZXLi61yJV/rn9OdPAR4j/gZmR5WopJmdBDdygS8FadG325lfzsJMdTQLu3?=
 =?us-ascii?Q?aEJ/n/9w3ccewSPEwZ16cQyEkjl7Nk9YqMywfzVcoMDEXPek9kAI7pIrZgCh?=
 =?us-ascii?Q?0S3QD0wzhWgXYmkS6AvFWW+dI/lJy4/xZY3YUcfgQrl56tdst2IjKRicEG8H?=
 =?us-ascii?Q?HrHB4kl6G/VjuXodq4Zoqqy5gEES4HZZ8bSb51GsrFC8nsW6wGpIPwvu8iTk?=
 =?us-ascii?Q?6ed1E6AFivEimU7XEpfyN09jJJZLD7DAt5PvLuMyYn27HqFCav4IA73gScjJ?=
 =?us-ascii?Q?DWXdqU3sHsf8BDmdWU3PEgneH13s81bpga+SZ+1Bkxe+4prkpqL0hsniPPkP?=
 =?us-ascii?Q?mT8ULiO2tCRWwzRPw/AqG1+tXIOsYFywEFyl3zSngXe1tVAG0KuoczbaxaHL?=
 =?us-ascii?Q?zQgZT3wbHxTv6217iel9gfdgqF3ANM/YXwpVdrctDDhGTKZM55JdmNpyPhh2?=
 =?us-ascii?Q?JgRN2CQKIo8z3CaPr0vI5keTYUMNpob7pJbXf6B2Zn1puXeIzPV3auOPprdI?=
 =?us-ascii?Q?/moXZFcvTru0bfMk0wGICnrxXbEgHeZILC53iDjXwW4JNLEIBPkH+fAXRZ23?=
 =?us-ascii?Q?/Xvbf0TyaMguI+BtMgvfTVIe/DxPI5PwbdGMF4cg2wDDERfmdaOT?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 451aa474-cb8f-4030-9202-08de962bbef9
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:32:56.6297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLijeuglRg2wt72xs9K3PWie7ZhhKRPcAfAbRbn2Ei5kTn4LY2d5iwaXtgwNK9t1h39mK+2SlLCuRgtMFRy+EsJKmzemfYSrISsgfBIxW0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8218
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Apr 2026 11:33:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9209

On 4/9/26 1:22 PM, Joao Marcos Costa wrote:
> Hello, Quentin
>=20
> On 4/9/26 12:29, Quentin Schulz via lists.yoctoproject.org wrote:
>> Hi Jo=C3=A3o,
>>
>> On 4/9/26 11:40 AM, Joao Marcos Costa via lists.yoctoproject.org wrote:
>>> Add missing "that" between "recipe" and "inherits".
>>>
>>> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
>>> ---
>>> =C2=A0 documentation/ref-manual/variables.rst | 2 +-
>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/documentation/ref-manual/variables.rst b/documentation/=20
>>> ref-manual/variables.rst
>>> index 60e608c0c..8466124e0 100644
>>> --- a/documentation/ref-manual/variables.rst
>>> +++ b/documentation/ref-manual/variables.rst
>>> @@ -1679,7 +1679,7 @@ system and gives an overview of their function=20
>>> and contents.
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .. note::
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 When :term:`COMPATIBL=
E_MACHINE` is set in a recipe inherits=20
>>> from
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 When :term:`COMPATIBL=
E_MACHINE` is set in a recipe that=20
>>> inherits from
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 native, th=
e recipe is always skipped. All native recipes=20
>>> must be
>>
>> Doesn't read well to me still. I would say maybe go for
>>
>> "in a native recipe"
>>
>> What do you think?
>>
>> Cheers,
>> Quentin
>=20
> I like the current phrasing, to be honest. My only concern about it is=20
> the grammar, so my goal here is to provide a plain fix rather than a=20
> subjective improvement in semantics.
>=20

inherits from native doesn't mean anything. A recipe can inherit the=20
native class, but even then, that's not the only way for a recipe to be=20
native, see=20
https://docs.yoctoproject.org/ref-manual/classes.html#native. In the=20
BBCLASSEXTEND, it'll technically inherit the native class but not via=20
the inherit directive.

What matters here is that in the native context of a recipe,=20
COMPATIBLE_MACHINE if set will make BitBake skip the native variant of=20
the recipe.

Cheers,
Quentin

