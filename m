Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1E7C433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 08:26:42 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.76])
 by mx.groups.io with SMTP id smtpd.web11.38576.1665995197802079370
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 01:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=SuKvSCnk;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.105.76, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Msi3iZR1Xgs0jVf6QbBbOMtcs20UJ6ozsDuWwXtHs8NFOC/97KYn7SMha4A+thbwTOYjUZgmi3ZREnMWVpUFAFwtfslnB9tmiv/ZVjr7a1b193wsUKWo+FFlcyFTdQFWEmxSIZjjrK+eUJW94Qj9N8/BNF3fLtaLa0h27u2kEVQSgnP6fXprtnYeDkxgX5B2XweqmyLdrRz8jcn+9MY35tvj2/tYInJSn89I0afpFQoKtLsy9xPB23ltIu9llenXj8ghSNNNydGV1vwjrztTYIy8ixwvGaPs47GDgITE57iD3vsamVhod0GdDLPDx70daqsZ8NlT/wV3M4QMSFJg+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9gjjpVauSAV7iHqiLST8r8RfPZjBilk7o11Z1ouKGY=;
 b=IIS+WpWIlwJTX/QNIuQUI9R7BtYWOpSR56jCcUhEz/W3/oTIt2AMhLrh8WXJyuu9M4cSARcilvwzBl1UPW+zEbcPE/4St7/ZuQKWVzPZK9imWxS7Q9aaizg2iyPGlo4Zahv/oFEjFGM6M5xI2t1bWs2DyTgqJB94cnraTzuInw34J8EOgJfd9bz8aKkOWPonYiMvwo390uhVQO1H7bfKnPkKPW0DcowK2zn0VOeb0ffwHRTrPGbinOJf0KqlLLSpWW+bRk01C9uTykuygLgsnOnbVqcNQeDqUBmc8pkEUCXgN2U/uarx+SLjQEj6WNSp78b64fOwBK98w3fb6ZDBDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9gjjpVauSAV7iHqiLST8r8RfPZjBilk7o11Z1ouKGY=;
 b=SuKvSCnkfSsGQcy45ZDDpUZEcPSD7NrjMFPzuy7FYfEywL54MuEbZcd1L3ftdE+waG0x98PvJfmrAFaRc8V3dX3LhnferO4jItGh0wi5Iw6ohxCokbzMuGPN8HOiLFxtfE5lIDIyWjpabUHTR0A+H/o6xsXyIwU9JN7S5EbvJi04jV145oJ2o9kQ1xAHadrDAuJltDy95dE4CCuNsAK6NjWf7lyUJKe5L9DWRkz9mhqGRvhkZ06ffOegLnKUkfUdSxEwDs2B1GosKlP0REgAtep1N2QEsuVS7boHjEKjRyCm6LVtFiqYiTr/rVXr2Vw7RIAKhN9dCXTMPA9eNUaW6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DBBPR04MB7723.eurprd04.prod.outlook.com (2603:10a6:10:20a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 08:26:34 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 08:26:34 +0000
Message-ID: <9676bdc8-a79b-88a9-0901-554a5bafbc56@theobroma-systems.com>
Date: Mon, 17 Oct 2022 10:26:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [docs] [PATCH 13/34] ref-manual: add pressure limit variable
 documentation
Content-Language: en-US
To: michael.opdenacker@bootlin.com,
 Paul Eggleton <bluelightning@bluelightning.org>
CC: docs@lists.yoctoproject.org
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
 <d0e6b7661912a5aeedc3e193ff76982cb0fc8dc1.1665392835.git.paul.eggleton@linux.microsoft.com>
 <936247d7-5cb0-2ec3-1a3e-15aa647d53c3@bootlin.com> <4749032.GXAFRqVoOG@linc>
 <06573b44-31c6-6d8e-c683-9f0f843057fa@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <06573b44-31c6-6d8e-c683-9f0f843057fa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0602CA0011.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::21) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DBBPR04MB7723:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ac12c2f-0c1e-463f-a33e-08dab0194d1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FSplKetZG8ON5ny6192nfH2tXlx0dwNQfu05MqIxTXLU12neEhzLQlm41HmqdYwwdIYMqs4OI3bO8M5mMNKB6KpQguDgkcjJS3J7HJARsUaxwoSKD4+UCKMZoKkezHolLDwn0IshXXlYHIPML341H0NIAKjRnbOce+nd9aS0j8i3rJ8KIpfr2E6brOymm51Ydk9KOghtOjNyeM7vNPSofRryVIP3fd65j2BKiYkpbPAM3dIuIG1UxTffcFc67gtDnR9RPvrohpT9saXXIs7hCXU7f8iN91rKjtEFKrllrQE4q2b5ks/TgsPpF3DG0/kteugp8voyXSwEYCiT6FMK/Va7Rmrc3O0xg6IIM5v4TV2LUvDt/KKAtGl/hPaLB+WxshJ6QTouStRhyJiJSUqppJw/cKDxlOtOSRezSmqcjuAQoDmAWAK7BsffATSsM9BShLQTKxhxosLqL0bPbytP6ldPW6DIeMlm9FbvCX7Dm1dytGVQDn9B48cCMcgWGi94X982d+9y6U+ar/vuaQ240iat1SzUqpgndIQKMZkQ3ga4IdU9n58Qi+X6794c6zw6utJci4QKXZV1GCLwKsOvf4Khc/OKbBcVc3wtEOCGZrhwF6xS//NZV0fvDY/a8tFNLhg1dcg7jUueU3Csqywyy5xmLhwuDHI/NaD2nt3pGXcSs0+ft07NT9RHDioVxHyrEyKercAr1yzMWNV2ViodgJDJQoW06IYw2YCZequXJh/XmeNTdtPzihRx86EHfcRWKW49oYMcx05es61+BeZ8kN7PLftNemyzh1THjpsEm60t4KbpmZ+QRrkhIMDnmSJH
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39850400004)(396003)(366004)(346002)(136003)(451199015)(38100700002)(31686004)(478600001)(966005)(6486002)(186003)(4326008)(2616005)(36756003)(6506007)(44832011)(6916009)(316002)(6666004)(66946007)(66556008)(66476007)(8676002)(5660300002)(53546011)(2906002)(6512007)(26005)(8936002)(31696002)(83380400001)(41300700001)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JlJ1426XJdo5C90SaEvyziOzTMTOrHCEkzccgd7GnNipJzLvgpUCtuFw6OOE?=
 =?us-ascii?Q?AkWKtH6Yo0mKlFtVNQ4/355KMs5f0ApA89szRTZLEBGiRb0slbH8liA2LQYt?=
 =?us-ascii?Q?78PTaZQve3wZLpBPLVsd5Ndkhs0WxenPV7CmBV0WL4UcZuRG5AtcgjhO0V7F?=
 =?us-ascii?Q?RXUQ+3S8k1bYdODkQyJoRMQF6ZjMVJYZuRKO31LYkVAJxQoRca1BLesWEH+w?=
 =?us-ascii?Q?RRJxtJeCEPQjBz7jQKJAwZup9Yq27jF5NXM9Sx/W8MJulr+srbvCNCRrOrcc?=
 =?us-ascii?Q?HUMnxP5GQqlUtDjx/UQJUuY0NO1ODqDbQLWc7t4G9A3glFnEf6Mrzqpz7nl8?=
 =?us-ascii?Q?NAp6y6qs/5dq8oTpAZFRxm2pkP5yrh9ERG+y9lcwt++quh7pctO+znUJZ99b?=
 =?us-ascii?Q?HgU9IXtmna6LJ69iPZeKZW15ili8tHEWEVF0vkaR2GY+b7vMCBVRst5NOdVv?=
 =?us-ascii?Q?oIWM8n5UyMsO0EXLTqfpRpLhg4vOOL+GerDUtZ+jE05BmpHoGbzcmpYsXmlr?=
 =?us-ascii?Q?H7k34B5nDDUhV/v80FroK8D9RPs3FDwQi/dX3qwQpQtCNw2S/dg0mmLhW40e?=
 =?us-ascii?Q?Dwo3K5rmrIeyYd4bVSdI5pb1UxUfEjPS03ujyy/TnYS/khgB0ttNu7R8uZ8+?=
 =?us-ascii?Q?qDxpWic/NOny5tIm5n/BySPzqPgsKm9tvVEneDsRarFMiIyIOQvElX0OJz9s?=
 =?us-ascii?Q?P4ybN41FK/cLRNc1tmiBOutXmrJbQyFprzIm4vHPGhWCkDJJrZEoqiXvfISN?=
 =?us-ascii?Q?K1ABjF+Cn3dZHNkGxEdYAyWdQemiBEumLXzkXZKtgrMGvb2VurYGdS+wiN09?=
 =?us-ascii?Q?c2/shmbH0IuUe/BuLQoSbvZ6ohdV6htP3oRAUCAy1mFz1y2q0RYXdmHv6qEi?=
 =?us-ascii?Q?n3FPbyXYsP4hoQaWaKXrM33DuIymL5UJnZr8xm8A4n6qgksFs2t/ldB/J6+L?=
 =?us-ascii?Q?GS9vnCE6MJ4TSNipcUHz8WThxn5az0h0AqEMWFN3U3vOW5qdMCtaDsKlS4PV?=
 =?us-ascii?Q?TM8WqH8xQe6Ebz5iE17JCrkTLlPN/cawFSyJfSZi6Z7fYb85W6Yy20VGSFez?=
 =?us-ascii?Q?p6dG/nKuSBshMmg8om63VQKRAx0bu6jhNmbI9PLsT/7N1QRkY2RG3VC6fZAh?=
 =?us-ascii?Q?LePHuAdr6BNOBB1pSJLlkS94ln2p0Y8rcRARubFPerZyWCMWJEnQKY3wt4+X?=
 =?us-ascii?Q?X29rT0fqjiypsU1atbBH6KLpvEOuq/oRIIGucuZfOZS8085LJprxd92TTCdP?=
 =?us-ascii?Q?pu9HkwDr9JP2VpGbMbiytz0WDy5RCiLJTFniGauXvTO6NadaJH8hf9ck+AFw?=
 =?us-ascii?Q?Gyd5jqFVdNZ3CTsnJNdt58XnBW2djnT/hEUjPDaVZNvQ5NCdXXEShgseG2Zd?=
 =?us-ascii?Q?F9YGw7hldy94Rnt/8+oAtPx6BWGU5UAPYDtcsRB2K2dKtZnCh0ffGhO1QgWv?=
 =?us-ascii?Q?/zVzDMNFplscS8RxbgrxQNinm9XaeE//XzNf7bhhRjNtE8Hxr/3XQj/jy4c+?=
 =?us-ascii?Q?V0uOFd5Jx6y6Mugjv7nLqsFjkCIzwxTYn8sqfbDu4BzsaWL8DfUBbSnOxPRI?=
 =?us-ascii?Q?N6buJjIseVNA3PxZ+Tz5jdqyJ77FdxKd6eMyA9KqBGL3zCP5Hf3qwEIW1L2f?=
 =?us-ascii?Q?1OSl3eqgP9PG7mQyBKsttIw=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ac12c2f-0c1e-463f-a33e-08dab0194d1b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 08:26:34.5686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kGYXy3TalgDflF/22/lw+Pybk2SGOhGgbRv7oO/CuAuLbIPY91iXRCYSeUi1vvbnj01/cimpv1ez2TCY/sgxnWXAsPvl+5POxyqLJZQd3EeUANdfOIU857lNA353PX7T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7723
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Oct 2022 08:26:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3366

Hi all,

On 10/17/22 10:15, Michael Opdenacker via lists.yoctoproject.org wrote:
> Hi Paul,
>=20
> On 10/16/22 22:38, Paul Eggleton wrote:
>> On Tuesday, 11 October 2022 23:30:50 NZDT Michael Opdenacker via
>> lists.yoctoproject.org wrote:
>>> Actually, these have recently been accepted in the BitBake manual (the
>>> patches from Aryaman got accepted after he left WindRiver), though
>>> apparently with fewer details:
>>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.openembedded=
.org_bitbake_commit_-3Fid-3Dc014281f72f4f54ec8e681ef2b8e&d=3DDwICaQ&c=3D_sE=
r5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZ=
hkI_-172IIy1t&m=3Dx6GN6XCgxQmI7f-H7T3WT3-Fm0BA5lJwsTI4AYj7vqNo4vO7FONFXbwhZ=
xNDjOg5&s=3Dw3C2EZQkLelO9mCiJE4ey-FVbNc3zA7PBHZ2nnBc4wE&e=3D 1080de9ab5cf
>>>
>>> Shall we submit your updates to the Bitbake manual instead? This way, w=
e
>>> don't have these variables documented in two different places.
>> Ah, oops - I missed that. I'm OK with that for now; however, and I may=20
>> have
>> also missed if this has been discussed recently, but it's my opinion=20
>> that all
>> variables documented in the BitBake manual should also be in the Yocto
>> reference manual, since they are two different contexts - the catch=20
>> being that
>> for some variables there is information you can't reasonably include=20
>> in the
>> bitbake manual since it relies on some definitions unique to OE so the=20
>> entries
>> can't always be copied exactly. If on the other hand some variables only
>> appear in the BitBake manual, there will be people who just won't find=20
>> them.
>=20
>=20
> I agree that BitBake variables should all appear in the Yocto variable=20
> index.
>=20
> There are already some variables which are initially documented in the=20
> BitBake manual and then the description is expanded in the Yocto manual=20
> according to the OE additions. SRC_URI is one of them:
>=20
>  =C2=A0*=20
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__docs.yoctoproject.=
org_bitbake_2.0_bitbake-2Duser-2Dmanual_bitbake-2Duser-2Dmanual-2Dref-2Dvar=
iables.html-23term-2DSRC-5FURI&d=3DDwICaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLY=
jLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3Dx6GN6XCg=
xQmI7f-H7T3WT3-Fm0BA5lJwsTI4AYj7vqNo4vO7FONFXbwhZxNDjOg5&s=3DMUG2hR2Xp_pBuw=
rtNxNwKRKxCuWXh8fgIcmZm7k0cTw&e=3D =C2=A0* https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__docs.yoctoproject.org_ref-2Dmanual_variables.html-23=
term-2DSRC-5FURI&d=3DDwICaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmk=
NPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3Dx6GN6XCgxQmI7f-H7T3WT3=
-Fm0BA5lJwsTI4AYj7vqNo4vO7FONFXbwhZxNDjOg5&s=3DjTk77XY6-zxpJ_a9dWSexbLvlpev=
2lr2-QfhnWYv74E&e=3D
>>
>> To avoid things getting out of sync, we could potentially have a=20
>> script that
>> would check for and report on variables present in the=C2=A0 BitBake man=
ual=20
>> that
>> aren't in the Yocto reference manual. I'd be happy to write such a=20
>> script.
>=20

This would be a good start, though...

>=20
> This would be useful, but if I recall correctly, Quentin was rather=20
> thinking about having Sphinx include these from the BitBake manual, at=20
> least for the ones which are only defined in the BitBake manual.
>=20

I'd prefer having a Sphinx plugin that does this automatically (I=20
haven't checked if this is actually possible).

But we can start with this script and manually adding those to the YP=20
glossary. Someone may eventually find the time and motivation to look=20
into a Sphinx plugin but I for sure don't have this time at the moment.=20
sorry.

How do you think of implementing this? I had in mind to just add a=20
variable in the glossary whose description would be:

See :term:`BitBake documentation <bitbake:FOOVAR>`

so we don't need to take care of keeping their description in sync,

Cheers,
Quentin

