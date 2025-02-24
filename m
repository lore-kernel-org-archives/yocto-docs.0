Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20104C021A4
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 10:49:06 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.72])
 by mx.groups.io with SMTP id smtpd.web10.86131.1740394136566819889
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Feb 2025 02:48:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=fUXHYp6F;
 spf=pass (domain: cherry.de, ip: 40.107.20.72, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vi4OzUWk8OHVrJz6ELXCu2GIw801q3dJVaWOCSfAEv3J/hl0LeGDogEqVtfGpJ8s7e4ga0yNHYWCsSQ0V2/fDFSnTSNW8+nGMgdekyrWSojpsgP7rYAFhmMtkp8we7Otz1U/sUEdPaLUtoW/VD459+j9CrTs9bLeGtfYbU8vMXWdPBbGURv0F4djJbRE/lL8ScrH3D86VEM4W15VQ1T2huNZW5GMIMwdw8rdqsXdT/nH2DvOXtt2buifx7k/2B6UGIf/5UtRcFxXWgveum3ygDb6iYjJIj+3/VLOSjXeZ6c3easu0FxuFUUVfcWZUn4AyZgR3X22o/Qn4HtMHRiNCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbKYGy8RFcsr6DEktOH5rBAfRHsXol6AJtGsgv/gJ2I=;
 b=oitIzXcq5w3knfk3CDJwF82Kh0eKrPQ/MTEHWsH8ZZr6w0pVBgTuv3vFnGV04Hcb2/5k8D4oOm4uvFHGrDvQOFpj+RMPLPhU/CHju7pZap9cp4nWHqQSJieQKeZbEy/hZOqKrfI3uDVCZ3hSo8y5BaCmpcTuTSNX28ljVeajrAQy7ub76BwFpkWjFHKvQmgVKu+K5uT7LFVJNbjnISVWgDaZT4PM3K16+zGvnhIkj4t2viOcN2HpGXxqSXOKGkzdctq7LMGjwQThd9NbchPqZA+I7yPyrSV2pq3Kc6YbiTz7t1Gp+Hi3Wke8URL+YnPKFrRF19lcCczIokTvM/MTTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbKYGy8RFcsr6DEktOH5rBAfRHsXol6AJtGsgv/gJ2I=;
 b=fUXHYp6F7wxrCwu+ed43dzUbiuUWtH+SartCB5CUbJw0GeEXRFttsn1ddkb99fRarofh8GJAN5uswPYlzSzLx09KH1j8RowqvtPkaFiHBjIdFIa1O2zk6Ap9J9Tf5BLoI6zj9RagUUGesGNi4XP57ImWaRI2ylP/sefeVpAWKFA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB7540.eurprd04.prod.outlook.com (2603:10a6:20b:283::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 10:48:54 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 10:48:54 +0000
Message-ID: <4a97fae1-ebb2-4c50-a3b3-359100faa7dc@cherry.de>
Date: Mon, 24 Feb 2025 11:48:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 4/6] overview-manual: convert
 analysis-for-package-splitting.png to svg
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250218-overview-figures-v1-0-75d23b5e7a88@bootlin.com>
 <20250218-overview-figures-v1-4-75d23b5e7a88@bootlin.com>
 <c11747fe-fdd1-40f5-943f-a8e999573e6e@cherry.de>
 <D80M5AHQKMZ7.33540OEYICE9G@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D80M5AHQKMZ7.33540OEYICE9G@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::9) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB7540:EE_
X-MS-Office365-Filtering-Correlation-Id: 2476f157-c8cc-4583-1a4f-08dd54c0d503
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y2pFS1Z3cXMwUnZsZGIzcTZiWUlweUl0S2tPaCtNZFFlTHpvYmpFa29XQ20v?=
 =?utf-8?B?b1A4MWxsb2hsQkZpajI3TXhMNWtES0VaL3ptbGxmZEdHcWpkV3dxYnF1MWJE?=
 =?utf-8?B?NUJLdDZqTXp2TXVCa0V5ZjIzMGd0aW4vVDNVaXZzanJwSDRVUTNoRjJwLzdL?=
 =?utf-8?B?eTVHczBhOUN1VlBTeDZuTWEwRE02V1FydnZBTmZYeW0wTnZ1eUhzblIxWkJv?=
 =?utf-8?B?WHpnQkpXditGZDhQNVliNUFhTi9wZ3p6OEdmNlk1bCsxT0tIL2VWWnVCOUJ0?=
 =?utf-8?B?bW1ERjJJUzhIbTFGalcwZ2FpZWgrZ3V0YkZVOS9yYVVWbFp3MGZVZU5DWEJB?=
 =?utf-8?B?MHdSUEJOd2ZyUjZhS0RjaEEzeEJiamVWMXplejVHTVJUN2Ryc0xEVjR3YzBj?=
 =?utf-8?B?VmMxV0NGSHJKVHFCS2RrZVQvajE1bWhUb1p6WHdCN3ZFS2xNYmRMZkFpZjRu?=
 =?utf-8?B?cE9aN3VUTDR6THZ5R3A3NHNlTFUyN2F4T0ZSZ24rWTB0bVhzcjZNck5HdDQ0?=
 =?utf-8?B?TVptRjdNeEYzWmdESGIyNHFHUnZzeEorblRCUDVrandJVGt5VStmTS9FZDRS?=
 =?utf-8?B?b2FYb3ZGK2w1amZycitXdzlIeEdFdFZ2NXF4N1dvbWxJL3FhRFBMdnRweHRq?=
 =?utf-8?B?L0ZyZldPbHpPTVREandpZDlxZyt3SHJleFdOUVp6cEtMaGNLRUdqMWFwZnhp?=
 =?utf-8?B?TTdCVnZOMmJwWEV3cW1BZzJQd2w1STRFbU9CZk04bGZYRzJRSVVKUGE1cTZK?=
 =?utf-8?B?MFdETWdreEUzOHRYbW9GaGt6Sk5ndkZBZ0g0cUtJN08xVXFSa1hXempmeGlC?=
 =?utf-8?B?dGdOekhwMnBwYTh3SzgxTkRDZGl1MENaRDhHL2l3YVlmOXhGaDNJdUtMeXRy?=
 =?utf-8?B?TFRxYTdJeDRKL25sNmFjQzcyc1FaZnBucnRybzdHTVpwWHRUV01LdXM5Tm5K?=
 =?utf-8?B?S1pBYmNJWHBUVGU5SzZMbHozYlc5T1hTdzJCK1JWVnpCeklrSzFyeEx4SUZT?=
 =?utf-8?B?ZmtJaUNHaHdmS0N4L0ZHOUM1Z1hUZHF1SDdySThva09RRUV6NEErZUxzd09Z?=
 =?utf-8?B?dUpVZTFhUG4xWXQra25mY0hyRTlXT09zQ1UxSEZGbWJIaE12eTZFdC9BWnk3?=
 =?utf-8?B?c01TS2x5bkthZTlORDFiWWpLM1hCdnRaUjdwbHlDUEhCSVZ5VFBlbktxYTVy?=
 =?utf-8?B?aGI0RkNmenVzdTV5YjVZZmNUSXNSNlk0dlcwNVVxd1NoRmo3aG9NemVQeEk3?=
 =?utf-8?B?SmVMMkl6SzVsTElIUG1HR3QyWXhPZ2E1Q2E0cmRBRmlkUmVESGk3MzNHR1U0?=
 =?utf-8?B?RklDK1RLVkFadmRuOFRkSU43N3Q5blFYdnJtYm1IT2lzQnpUajFUcE4zWXFG?=
 =?utf-8?B?blA3RlNtb3V0TUV0RjQwbktFRExrd0ZLNStSUDRHUDJzUFlwVTZzZ2RUbmQz?=
 =?utf-8?B?NjkxclkzcW90YWc4SlVGS3hIRWV6TUExL1RKNXR1NkRobnhhNVBjZndyZi9H?=
 =?utf-8?B?NFhzUENUUlQySFoxWlRoOXc4emxpSTlxYWZGaWtKbWNXYmtPM0JoTi9WQlBu?=
 =?utf-8?B?cXBoenc5MXRNaG53U054N01iQVlzVGxLQ3ZFQi9PZlo2OXNZZjNYZ01IQXVJ?=
 =?utf-8?B?Tzh6OFJDSGJmVnQrT2V5MXdmeVVPbU9UUTZYU2ZYMDRhVnFaRkdiUklIcGJn?=
 =?utf-8?B?M1I3OG91Y2dMc29OYU1jYW9qZWo5VldYKzFaYmZpZmFjdUdSYlppRzZacEZs?=
 =?utf-8?B?dldjTVgvNjUrTjltMDVFRDhURzdWeHBJYy9UMVVQZ25UVDRrQW1FM05OeW5p?=
 =?utf-8?B?MXdIMmdsc0ViV3dlRkNWN2NyaWpSZS80NWp5Q0xSNnplclZDNVlRSEhKdmxQ?=
 =?utf-8?Q?DS19jVyXnKPt7?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K2E1Uy96MTFnNFJ3bzFyQXNLRE5sTFJBemYzbEFUanRmYVRUb204TnFLbXJp?=
 =?utf-8?B?U1lSMGxvTlZyOGFicWtIMzBSWXBnK3BIWk9tRERnUVB4RmpMSWFaSS9YTGEx?=
 =?utf-8?B?WmpHbHQzbDJMS2hwM3k5MmVDeXhEK0N6Q0F3dzFOMHgyUVAvWGgzRkkxQlJq?=
 =?utf-8?B?bDRqaGtITlBHQklRQmFUUlRQWGh2L2hob1crRUUxZzJpR1ZZcmxLbmgrMjdJ?=
 =?utf-8?B?aXNXV3Nic0ZBcVpYMTg4R2daeWZEalNVQWkwQWhmUG1NUThOTHNWcmNnSFVZ?=
 =?utf-8?B?bTA3RlowNmplVG0xSkJpRHZDalBpOUZpNEJiWTIvUGhwU1FuUjJwNUx1OStL?=
 =?utf-8?B?VUluRE9BVFk3dXBvbStaZno4YTU4dzhJdE5CTWprTkpzVTNZTGVYd2pXOEdM?=
 =?utf-8?B?aXBVRVphQUpVR1JVY1liSXVJYzRVcThzNlFXYktpUUZadnkra1VDVHBhRCt2?=
 =?utf-8?B?L3BzZldveFNQMWhKVUVaanVxc0Y3UXU4dEdXN0VyQkRTUnQ0YWQ4TVNsU3JI?=
 =?utf-8?B?WXQ4eDhydGJ3YXEwaWRDVDE3V2RrMWc4THB5OWV5TVN2WFZvZER1YnRTY0xZ?=
 =?utf-8?B?WnlLM2VhRkVidlpFMUtjdCtWOFg1YXdBMmRJeUdjdUQ5aVhjYWlYNHBOcHpi?=
 =?utf-8?B?RnJXRitjbnBvY05WYjFiUXJRVzNONmRWTm9EUlVLL1dBQ0Q0ZGVybWQ0Qjkr?=
 =?utf-8?B?NnVZelArM1RGYXp1TExnaGJ0SVo4enpCajVyVFcrSGFoQk4wTG9RUjg3R3d4?=
 =?utf-8?B?WHFSZE1INlNxNnpjaGtTczJFbUZoSmpmVTQvTGduMjZNUlFHUmYwb2ZQUTZI?=
 =?utf-8?B?VWE0QTIxaE5QeDFKQnRZRGordWZVQk5WR2xMMnNyWXdBTHBuYXozZzlVY1Mx?=
 =?utf-8?B?TjFxemRhcUs2V2NlTzVZVU12MGs0WEdsbFh6ekhIbU4wQXR0dzJ2NThRRWc3?=
 =?utf-8?B?YnlJSkR1SnVQY2ZSZXJTYXBmRTRlcnB5djNnN3FSeTZMMXViM2ZSYVhkclhD?=
 =?utf-8?B?cndRYWNxaEhNYTI1aFRLSWxxU2pkbUEzZGJjT3N3QzBXMExVa0VJM3FrcmxX?=
 =?utf-8?B?NXVUaEpzN0VGR0pOYVNYVzB5NDVNUlY1TUJYUmVGMmp5ZnZIZDhzazZQZlZm?=
 =?utf-8?B?Q3pySm9lT282YVdFTElLL2dyeXZ3Y29UZml2aWlMbU5YbU4xYzVnZUVwWDFn?=
 =?utf-8?B?bUw3OWVjTzFiQlU1YVNwTDdWMmZIS1NLRDlTVmc3MTh2bEhTeVVFc05KV1Yv?=
 =?utf-8?B?OTM1MnB5UFBydWZQZHhheTVuMGZ5S3BNRmsxbjdWVDVrSVp4a0w5UFo0TXZr?=
 =?utf-8?B?TnhsQkc3QWxDdEs4bUgwbTVSditnZkhORGpTTDdHL2FiWFBlSHRTWDdwSmNm?=
 =?utf-8?B?UFh2enZRUDhBZ3lqQU5DYkNTTzBwSnNNcDRRZXR4VS9BRFZxRi9ENXAyK1FR?=
 =?utf-8?B?THpqZnJJNTNlWXppb3dqZEJDOVp0WkMrZEFrM1Z1Z1QrcUUvS1hWaDhXTmd6?=
 =?utf-8?B?emdJUWMrUVM3YWhoYTcxUzEvV0lYQWY3N0x5VmMxWDNqT1Z1UGhhWWZJRlcz?=
 =?utf-8?B?TE5jYWR1YTNJN1Q1dnQrTnY4bzFidjFmVXU5aGdUdHRZaSt2c2VBbG5sLzZU?=
 =?utf-8?B?U1NBMngyVVExR1Jyc1lobGppVDdFZkoyVDdGYXY5L2F6b2padXJ2aWtJakhO?=
 =?utf-8?B?QUxNb2NUVlBJazNJbDd4RnZBZjkzSzNhN1p3WWQ0dDBXWWNjY3lkMUtmM3dX?=
 =?utf-8?B?UjZ2NnQwTGhCS0ViSklTa1hwaktnZEd6OXBrczYrV0JENDhyUWQweVg2S0ZO?=
 =?utf-8?B?cW8zT2JyRFY0RGRBQVhTZktZYThRSit1MGFzTGsyVVVZaXh1RG1GSUJ3d3Jo?=
 =?utf-8?B?alhrTm00SnhUMzFYY2hZeFpXYXg3ZmVLVkNrbFlNTFJzNzZIRnZLdEx6YWZD?=
 =?utf-8?B?aStXWnUvZzV0NmowRDFwbjhIbUgvU0Z2OWVNK1FuQUhmcktHbDRPZGF0blkw?=
 =?utf-8?B?QlRvOXRJY3duMjhxQnF5S3dJdDlyS3FFMEMxNTY2OUlyNTkyMlMzcElzNC9h?=
 =?utf-8?B?a3hnc3lmblo2R3dVT2ZDdVpFV0h2WmNLTnFJT1c4eFYvQ0pkUGNwZEVsRWJi?=
 =?utf-8?B?dUQ2T0Z4RFZTU3JZeXFadU1sWTdXRVEvVWtFTDBBUTFnQmhFUWE2KzJZTWtF?=
 =?utf-8?B?bVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2476f157-c8cc-4583-1a4f-08dd54c0d503
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 10:48:54.1650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2/ccRb/3ZgTXp/SRfO8p6wE85ApuGDGvz+3NhnIMVAzOcVNR9bNGuW1fzCpFeKYzsrtplzAtQwkBYT/Wy/p521qX5LsASQIQw9hn0wGTq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7540
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Feb 2025 10:49:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6439

Hi Antonin,

On 2/24/25 11:44 AM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Thu Feb 20, 2025 at 5:18 PM CET, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 2/18/25 10:11 AM, Antonin Godard via lists.yoctoproject.org wrote:
>>> Convert the png file to an SVG file, and add the UNPACKDIR reference.
>>>
>>
>> Not only that, it seems:
>>
>> - -${PR} suffix is gone from ${PV}-${PR}
> 
> I should have mentioned that in the commit message, but forgot.
> 
>    $ bitbake-getvar WORKDIR
>    # $WORKDIR [2 operations]
>    #   set /build/../work/openembedded-core/meta/conf/bitbake.conf:409
>    #     "${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
>    ...
>    # pre-expansion value:
>    #   "${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
> 
> See cc83e4548465 ("bitbake.conf: Drop PE and PR from WORKDIR and STAMP") on
> OE-core.
> 
>> - ${BPN}-${PV} has become ${BP}
> 
> Because BP = ${BPN}-${PV}, and I think we better stick to the correct
> definitions:
> 
>    $ bitbake-getvar S
>    # $S [2 operations]
>    #   set /build/../work/openembedded-core/meta/conf/bitbake.conf:413
>    #     "${WORKDIR}/${BP}"
>    ...
>    # pre-expansion value:
>    #   "${WORKDIR}/${BP}"
> 

Yes, another option is to do that through commits, e.g.:

migrate to svg first, then add UNPACKDIR, then remove PR.

But I'm not sure editing SVGs is a lot of fun, so mentioning it in the 
commit log is acceptable :)

Cheers,
Quentin

