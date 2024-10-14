Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5003DD16251
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 12:16:16 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.48])
 by mx.groups.io with SMTP id smtpd.web11.53454.1728908172468904911
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Oct 2024 05:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=KgrlTSgm;
 spf=pass (domain: cherry.de, ip: 40.107.105.48, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/ptsN1QuVmYnp/o8+d2Oz2oWRZB0VkxJHAOEEI52tYIWyWDXPLXRcm7AV/3k1JORu75RBQ022dTn0PpMJSnKDpyjQFFGr7ivKDte6J0D1s6yHmMLje2xnSNYdQl6St4R0AwalGRoGkmLOwrjWKggqVMwiIDrUHrgcDICarbpvITWB4ggE1exawf0afwyogHxI0vxWsIpzbK2tkB8chIycUApP0vzaDF3sRoaWyw166wEQQTHS01fY9KWFKWPpc8RoODqm+rAOG7esznt2t/7WEdaD/c81cZqguIjv+XR+ekRG/7FHo0PUp8InlHpCTExRZWqlVEE1XCcl03DIVZrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XspCIpVAGs98W74IbItvRSzGgFBMfBGYMCm81qD3f0=;
 b=R8l1S8s/X+p8sbs9qohHcJ1aLTK9jqexA/VVb098UQLuRDrqNqW1DRkarnYHu8t+4lk/EocQHYw9jbRpmRAEtqm/Ojx26cNGfSoEDH/RuWleiW5nYkLd3GQtSq75kdkbLxm6yMBy/l26xOw5h+Per/0JbC6bQwIIXieJbuiWtzy2St5sbIfuRlNdsvdYPtNWy30FcLuhjZGxDJQTVGb2sulV1SLj2Yw5hqL+9Ay6ptXftaM/qEHjcbe8xsq1vJK0o1KZqsK3zOIjtEHXFAKrYpknzmGWi1sm1Vnd3GAN1Hpz21DY12DXWabmjlszvu+ss7SLZSyVS6ClHmSdSsaeog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XspCIpVAGs98W74IbItvRSzGgFBMfBGYMCm81qD3f0=;
 b=KgrlTSgmx2HG0zStxy3NlMZMI3D6yl+i1I7Yn+Ns3bcKSQqRTDV8ucB67iUjiT5PVZkKR/74JGCZE0nGJ/ryRQuKo74I67jazn1V2S4S7J9S8ekOuO2qIbeahnuM38S7n7aFBKvExTbgPl01G8p+RN4uSAWydeSzJUtiVbCF5rI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB7685.eurprd04.prod.outlook.com (2603:10a6:20b:29c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 12:16:09 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 12:16:08 +0000
Message-ID: <f34d2700-ae0f-409b-b4d9-c864de975d57@cherry.de>
Date: Mon, 14 Oct 2024 14:16:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 14/16] ref-manual: add mission pep517-backend
 sanity check
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>,
 Paul Eggleton <paul.eggleton@microsoft.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
 <20241010-release-note-5-1-v3-14-2cef1a58f1ab@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241010-release-note-5-1-v3-14-2cef1a58f1ab@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::11) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB7685:EE_
X-MS-Office365-Filtering-Correlation-Id: 30176329-c04f-4a7e-ea69-08dcec49fc14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OHlJM0puNGp1M3JTN3lqWmU0Ry9wQ1RNM3VjL0NBUGcvMnVNTEh1VkYzcjZB?=
 =?utf-8?B?STFpak52VGtoNW9hTjdBVEJkVnAwRUppZjN5R2lORnRnaWRMMVc4RGo3NENr?=
 =?utf-8?B?aFlKOEVQY0x5TWdUdDV1YU5EVXAvdGhZVkpYVkZLd0lzZDJmOFpINmN1NEZ2?=
 =?utf-8?B?VGlFbjBOSjhVWU9xMlhmRm5vZ2NvV2p4U0tQdGxVV05aanZQTXNBd3diMHJ6?=
 =?utf-8?B?bitzTytOUUl5enZ1Qm5zRTZFN05nV1h5MVFzUHEweG9mSldIWjdjSUhBMjZY?=
 =?utf-8?B?aGtSYXNFZjl3R0NVV2JwSW55Yy9nK2JwWGhkREorTEJaUk1iMi94SHA4cC80?=
 =?utf-8?B?NzU0Y0NiSHl1SXVOZllUN2tDMlpCTXpWYnZIQVh1b2ZXdTNvUmh5YWFsN0Js?=
 =?utf-8?B?ZkhTZTBSWXgwZG1OL003blVEWnVFY0pwMVgrMTBRL3hKRjBmTm8rMVJTSWxH?=
 =?utf-8?B?dXBKUXUwaTJSVVFZbjE0YUpwYVUvS1VoV3B0cUVpSGtSVG5FZDZla1E5OVV2?=
 =?utf-8?B?YUw1bUQ4WmhrTGJVb29OYng4R2ZYWmFMTjMvOWFtQzRYRkJLUTBmV2QzWWJ4?=
 =?utf-8?B?cGgzV0liWGRPZWtmZEY4L1dmcDR0Y3JKZGNMQk1UQjVYV0FhdDVZMk45ZGgz?=
 =?utf-8?B?d0xod1IySWh2S0p2WUJ6V2hHNjVFWm9uNnk0RmplNUt6aFliOEo3L2lucXBQ?=
 =?utf-8?B?T1doeHBZWktmVFNPSGRMMDQ2MFN3Sy8reVVTcmhMcUFBZ3BnRktiMU1jQmJU?=
 =?utf-8?B?WHRvc3AwbmM2c08raGZZTVpiWVFaL1pOK2tXanhtMG9nalNpMWZaOEIvbTJT?=
 =?utf-8?B?VmJSZFBHaXF1MjlnRWxibkJ6aXdiQ0Y2eWNNWDFpYUY0N214REk0WFNJamJO?=
 =?utf-8?B?VlVMRDZ4TGpNTlBUK2ZxUjV4L3B4WEVCUDBhd2hnY0w4WE53YmFFcUt3T3Ev?=
 =?utf-8?B?aEM5MW1QMW1aTituK1RBY3ZiVHlVeHJub2o3V0xzZlpHcmMwSklxWWV1UHhs?=
 =?utf-8?B?ckN4NEJxR2hOU1ArR09XYmo0UDlDWWdmcis2WWtxQXRjWWtVZm9LRFZCWkx2?=
 =?utf-8?B?ZjVlV3VxcG5ja2tKbVYzcy8va0szMThIbzBKMmRmMHl0b0NXL1drU2ZUWU01?=
 =?utf-8?B?S3plSnI5SkJiMUZ0ckNaSmJFazR0VURQUzU3NFB3TStnSlJIblNKR1FYRHV2?=
 =?utf-8?B?aVRnS3V5TDZmNlR4cFpqUlJ6bTc2aHozbnR0aGZRYmRxU1IxMWsrSmd2Y1V2?=
 =?utf-8?B?ZzJkNEU3SXhld3dnSnJBa3U2VU9mV01jZlQ3eWRPTmluMlI4T2xlK2FNUm42?=
 =?utf-8?B?aFg4YmFiRUFiaDJYWmZjaHUzeFF0TzllRjU0ZmZLYnU2QWNQUTA0emhHbzd1?=
 =?utf-8?B?eEw2VkhGMkg0REs1WUx2ckk4NzZlcTBBeklUeEVueS9pQmRDRGpjTVkwSVdB?=
 =?utf-8?B?TGxYYXVIc2wyTVJkQTFFSllPd0MxNkxySFNsclVIbFJlN1AxZDVaYlBpUm5D?=
 =?utf-8?B?S1VvTlEyWjhDcWtELzdVbmduVHhZVnluQ2FKbmtsTTh3ZjYrNjdQMFgyVUhi?=
 =?utf-8?B?U1Fuam4vb2Z1eEtpWncvd0xCS1JManRxMCs4N1FpVTdmTzBzUEhWSDdLSHB5?=
 =?utf-8?B?aG52SThQdU8zTENKNGJIOEl4Q0p1eFM3MDhxUVJPK3E1bXNSOUlXNG9FRE1U?=
 =?utf-8?B?TmhrdmVjZVVNYjd4U2hROFQ0eUdzRDBJRnFpT0pwMWxRT0cwYUFLell3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M1ZpQmxGNmlxdGRiLzZzS2NQTTZ3SUpGdXZGaHY4dVl1UG1Kblp2N21vTlhB?=
 =?utf-8?B?TnVqV3czRUtOVC9OaklETVNZMnl4a1JJTUU4cFNsU1Y4eUo3WWFwVFpsYkVF?=
 =?utf-8?B?aEpKTkV3WXh5TnQ3eUkrTFc2cFNSdE9IN000UklTQlRsMnZhM3cwZWpiNjFy?=
 =?utf-8?B?eEFWQkJuUVRGK2pWMjV2WHAydEs0Z0RuVTZKN0pDbjdRVHFmbkcxMFBDVlp2?=
 =?utf-8?B?WUVnMUNVL0FsR3VPNTBmeWdsSW9HdmRQZTgyV2pmMVI5SjlSbmoweEpTdk9v?=
 =?utf-8?B?anh2ajluSzlidmFJa1k5UmpRRWJmTGNoVjJTMXoydWdwWjd1cDE3UGFpZ1lT?=
 =?utf-8?B?RkVyT2lGNHBWRHcwUnZyVXNKcC85Ri9TTXZFZHRZUzJmUlZubEFRY1JGWnp5?=
 =?utf-8?B?U0dUS2FFbjhsUWpqazdEY1ZuT0ZnaWlMcXA3MWVSb1I3L1gxelI5V0FUNEYy?=
 =?utf-8?B?MDIxODFoYzNibFpYOTJJc2hPMnBPMWJkZHoxM0dzYXc2aDJoMEdKNS9BdWZX?=
 =?utf-8?B?Y29JU3RNVktpSEVrbS9VYlErQ1RwV3RaK3k2UjViK3RIaEFGQUdIbjI5aWdn?=
 =?utf-8?B?WEpYMEpqbHFVZEJXMFlpSjdzYWo4cjJpcWtZSlZ0R3VqU2doMmtWT1d3U2M0?=
 =?utf-8?B?aHMxelpHZE5oSmFzTnZQb3BaRDZxeWNWbmFCSTd3dDdEeXUrcWFGQlk0bWpq?=
 =?utf-8?B?WHJwTE1tM1BIZ1I0aWVER1ZZRi9SMmlvWXdNQktGRjNXMXJFZ3FFckNGaXJa?=
 =?utf-8?B?T0tJSSsvZTBwb1NmbXdNSVVqcGc0Y1ZkT0VFcEd2cVZiVG1JNzkyMEFHTjBV?=
 =?utf-8?B?RFdJcVZadjBYdlRaRjRpakZrbkVNSzdBczVtVGIwWTBaYXU0dUQyTUFteE1N?=
 =?utf-8?B?Y3dzcms3MTBiZ0M0OHlCeC81SE1kZFZuSXNNVlIzQWcyQ3lKQStENE92M2xG?=
 =?utf-8?B?QXR4Z2lwQ0Njb3kwdDNRNS9xVDRsSHRNVnFIa213Zkp1Q3VwL25FQWRkdTlO?=
 =?utf-8?B?SlNNcGxiZFgxcGkzeXNLY25XQ0xKaEplT1lZQTdob1pQT1BLWGlZNSt5UzVi?=
 =?utf-8?B?MFZHQkFOdkszcG95dHV3WVVmajhFTjB0ZTM4QmUybS8ybGl5YUxMcU4wdDh4?=
 =?utf-8?B?WkRMQldrUkxlUHhtYTRyd09rQnlmcCswTFRpU3NtZWluTWhwZTJ3SlFQS082?=
 =?utf-8?B?cnlrR0hUNGtPRnBEa2hpWk9OcDJFbktuRHlmdStyTWJrT3FVYkpoRkI1ckVk?=
 =?utf-8?B?MWhhNzc4K2YrWFBJY25sbmNMYldndmo0eUx0UHgwVU5TL1lGVERZeDQ1eU51?=
 =?utf-8?B?cHBoWWsrbkVaRGZYM0RLMWdnZDRoWSs3bTA0RWh0ZUtHOUZaQURjSjVEbHll?=
 =?utf-8?B?eUloeXJKQkVLdnBjNFJnY0ZveTVDZDIxR3I0c2wvV2podGUzSDI5Ui9pT1l0?=
 =?utf-8?B?Y2V4ZHJYRWNEa3pnMWo4RXFpc1RUazc0ZktSUzZsaUlud2ZHc2xNQ09uS1py?=
 =?utf-8?B?OHhKRXdxdUxrb3V4R0Y3WUo2VU9PM1MyUDBnVlBJZEJjb3dHd0dzUndTRHJF?=
 =?utf-8?B?WGNhL2dJVFZad3RDMkJOR284TlhQU29qM3VieXc2U1lIQ1ZuYjJLYmVIK1FI?=
 =?utf-8?B?QkVnNnZlQW9FMHhsalpJbkwzeGl3U3RqN2RwUUVjbURtcXorVHlTSlh2RDgz?=
 =?utf-8?B?VDZnRE1tcnFZUzZ5VzFGaVdHRzNqS3JCUk1ORmJxNVZSWjF5bUY4ZGdXOFpn?=
 =?utf-8?B?aGk1Q09JUVFFeTRJT1VBRlp6VlBIYllldWgzY0wrcGtYeUJnNFpzNkFaNm1J?=
 =?utf-8?B?Y1BlcndKU2pKTmxCVmIyeDVWUEY3enhOSmJBZFpKTTRoTm1YUENLa29IVkdk?=
 =?utf-8?B?UmlNeVdtOWZJUXIyUmYyLyt4a0tEclFWamdHNm9TNm03MjB2Y3BZS0ZkcEVS?=
 =?utf-8?B?SUZITElTSXhhZjd2S0cwbVU5VmRFZmNIcEQwdDdyY0grcEVuUkhrT0szZStF?=
 =?utf-8?B?L2NBYzgrRGNkcmRMNVZPR3JwZDRCdDRaWTBNUnVEWExnYU5SbnRGTlZnL2pi?=
 =?utf-8?B?Tkd3K2h5bTFGN2pERUVySkJHTWdNNytPeXZTTXZyMkl3ZHc4b1ZRNklNQVFM?=
 =?utf-8?Q?BRpkeqVviD8reapbGFZtiPDZG?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 30176329-c04f-4a7e-ea69-08dcec49fc14
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 12:16:08.8579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n+hlUKCTAfT2eknAklkh/V2ObAmGw0j2gRZxoo2N9/a7zW3+ctWsyZFKYg1sbZceLuT+YVp9sGUzU3v1kK/clAnK7ljufMVE+MckuPcORVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7685
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Oct 2024 12:16:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5480

Hi Antonin,

On 10/10/24 2:10 PM, Antonin Godard via lists.yoctoproject.org wrote:
> New sanity check to check for PEP517-backend compliance.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/classes.rst | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index cdfd1f7e3..a715be97d 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1478,6 +1478,9 @@ The tests you can list with the :term:`WARN_QA` and
>   
>   -  ``perms:`` Currently, this check is unused but reserved.
>   
> +-  ``pep517-backend:`` checks that a recipe inheriting
> +   :ref:`ref-classes-setuptools3` has a PEP517-compliant backend.
> +

Not sure we follow this for each entry in that list, but this one is not 
in its proper location if we were to alphabetically order the list.

Cheers,
Quentin

