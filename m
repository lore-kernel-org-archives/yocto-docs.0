Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A0FCCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 13:07:25 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.9])
 by mx.groups.io with SMTP id smtpd.web11.32118.1761570436936232751
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 06:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=JEpiBUXy;
 spf=pass (domain: cherry.de, ip: 52.101.72.9, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iK8P4l6s2UH8uur0QjqfICr/11JN2L8Bv7nxpSJpbLQOZWx/dzeCFPpowlZsg5eW6cYjXcc0IdI3njzNn0FHows9ULJHiaP6B3ONzwg9GDhFNc6uCYuyV6uqVVV7gmvhus9k72HRYziWGtwstc4ePOxQoRnr71mpL1SN2ROaEacFkPL3ijDlKGz+lAtubnuoy++Pc0YFx1uybVJDZQKkafoewDCXJQ5B/beVu2YjEXnvxMHLKgf6tD0NJaume7nD2M0FMd7eOHz/OeJ1jb+h6htDd6Xy0Xx0HFkQugV8DF/42JLXOHb+p+1LHOMHsdd2gV/Asy3wBH+zwbbC9qov4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krQySTbhlW9HPfmWHIJrOS4IBCeUOpqzoYvbzndhpmI=;
 b=bc+NnV3WSHrKgfk7te+bYW2AKSt7tUEgWSya6xia5laUr5Cr/F9YgRNA3qxOzdxb8MuojfTG0usAuNuJmaoO3oFNSp9HeOgy8e6uJDAYgshm5wBrUcySn4Mib302sV19xNKDDbedodIH4ps8J0QzQwgAUVZmZcAJSu44Ik5Zp518KjCP8WNsCTl0OTH0hRQG1TzdPJp6XWLt7jV+Hxz079wvOf1qj1c7e8s/0WnUB5NJt+6flToIQb72sl+BjwH9jlWx1nNM8ORVMT5xa0geqmWJgQxQ97LmhKlQwUcOiZAjxV7C6zlpxHzO9jd/tH7t5lFcP7scPVw52MwNEBG0YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krQySTbhlW9HPfmWHIJrOS4IBCeUOpqzoYvbzndhpmI=;
 b=JEpiBUXyfdsXQXNOyQE5+9XOYgOMqIwEQxxE+9XEe05vs81dpkm/HvhLEWaYcqn3fr/Q9MNDyD7tXrlB0HQg9eXC/xnZHGMUtwayBtnJmvY6mKQpoasyyCHvGQbnbmLB86w2/PsZL1QpSwR0M1kwZAAqIEsQkYMx19OgfvNmZ/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB11579.eurprd04.prod.outlook.com (2603:10a6:10:60c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 13:07:13 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 13:07:13 +0000
Message-ID: <ed52ece8-38a1-47a6-9007-450dd64b9c34@cherry.de>
Date: Mon, 27 Oct 2025 14:07:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 04/16] ref-manual/classes.rst: ccache: mention
 that the host's ccache can be used
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
 <20251027-release-note-5-3-second-hunk-v3-4-07d36e2380b8@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251027-release-note-5-3-second-hunk-v3-4-07d36e2380b8@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0321.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:87::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB11579:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a9c8dd5-e09a-4c8f-2536-08de1559be93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bXRWZkxROHVUL2lZVUZLVHdOTkdwNTZ3Z3Q2dXBRVG9NdnFzWHBIUEc1UEg2?=
 =?utf-8?B?aEZMV2l1N1Z2TE8xY1FxVHhTNlpSTjNobkdqYldhK3FEb0lJbzY5ai9nRG5U?=
 =?utf-8?B?ZEE3bE9yTCtIVUNoNU4yOUpHZlA1VmxEUGR1aFM4VGRZdERJQXhBM3NKaS9y?=
 =?utf-8?B?QmpKcGxBMSsrQ04wRGlZeDNENnJHSlptb0pxMWNBU3YyUmhxSWpnVVFJaDg5?=
 =?utf-8?B?T0lGaDlsWDBOWjROT3dwSkg4NGRFS3l5aGF2S1dPTndvc1NXUkNrZWdzMzhr?=
 =?utf-8?B?eXBSay9BM2J5SGwza1E3NzVIRk9IT21FUHJJZ2dxMzMwL2kzNjFWcS9JYlBV?=
 =?utf-8?B?QUMvTVVuSEVEZmhRajYvSkRRWi9jV1NCU3RjWHpOeXFwOHVKT2V2MUJ2WWM2?=
 =?utf-8?B?TGJ1MGRRd3U3V282d3YrU3N6ZU44WnZoZ2xGZ0ZuQThHY2VYaXl5dWNnVi9a?=
 =?utf-8?B?M2pweTI5dEZ1bUtuVUxNY285V1UvVWRWV2ZjT1hUV21kcEx2TnhDS3lnN04x?=
 =?utf-8?B?SDdKdDZTQjd3ZWNhYzlzc0c3Z0wyQVVUZ0JnRUw5SW52V3BybmNFY25VdGFv?=
 =?utf-8?B?UkUrOWZXUUhrc1U1Qm0rK2FaTjZsU0VTUXA3YkZpbGxhdWZvNXdUQk9FWmF5?=
 =?utf-8?B?Z3JJdWZuRk5XQkVGdmdGd0g5bXVTNzR1eVFIU1hCR0RPZmpVUDlDR2V4TmJm?=
 =?utf-8?B?RDNpVHc2MTdIdmp2QVJZem5qdDNhWEZhb2o0VTVYTUgxUm1hQldNMEhCSnRE?=
 =?utf-8?B?SzdGR2hpM0p2emx2Rzh3Ylpqd0l1M0IycjlsaXJVZGFkekxhUnhDNVRVc1Za?=
 =?utf-8?B?SnUrL2ozWTh0VlF5ZlJzR3JiZjFTeHZMbWRxZk5kTXJpbTFycXdUekFmQXpD?=
 =?utf-8?B?RXZPT20vdHQ5VnFyYzNINy8vOHFtRVg0UmlzZzhXZ25ZK3FMSWhnZk12NFVV?=
 =?utf-8?B?OUZ4ZTdwaHBLVmJaSGYwc09LckxLM09leE4wNGFIZkd0RUJqc3JqcXQvV0Vp?=
 =?utf-8?B?NlZBdk14cFRDZ1dienVYcmMrSWdXM2RJak5BUEpySlNXNFlUcFU3RW1HcDI2?=
 =?utf-8?B?S2VqTzFQOWNRcTZtaHh6c0VNVEJyanNsT2pxNGlxTmE5R3Nwb05LNEdqUTV3?=
 =?utf-8?B?Z2xLc1Qzam1UVnNMN2tTQ3R4N3Y5VzA3emRqenI0dzJaNEt6U3g0bVk4Nm54?=
 =?utf-8?B?cS9IV1BqWldwK0plaUNMTmxhVVkra0orK0crajVOeUs3SFFWbzdiN0F3b1JJ?=
 =?utf-8?B?S3lyTUNhYU5ZM1REZEZPQmRjSldpdEVCRUFKWWdqYWowRGczaDdkWVB4a2I1?=
 =?utf-8?B?ZUc5dTczM093MWl0YktQWEx4K2RjTktGaHl2dTBFaVQ0c1ptaFhWTUppc2xh?=
 =?utf-8?B?RFZtVzZhSWRPM3AvSjlWa0Y1TFlXUnRJeHNzVzRrK1NER05hY2V4WWZFYTVa?=
 =?utf-8?B?U0srUUNlTHB5Sm41TlNRVWp5VG5IbDRPOVptUkFSemo3Y1JwdW1wKzNiTUhN?=
 =?utf-8?B?ZDR5SVUyWXZURFBEMlpLbnhtOEdqa2cySXlNOGFnTHYzT0I0eGM1TkxPUXd1?=
 =?utf-8?B?aVBBSllzdFBmZ1Erck9xOXl0N3JUd245bVZtOW93cDkrU1c5dmFTVG1jaTRN?=
 =?utf-8?B?d2UzRFVPUmNCR1QwODJzb0NnYWlUcUVFSUlxbW1MRWNkekJHeHN0bEZldTRl?=
 =?utf-8?B?VmwyazhRZGNYT3ZnTUF0S2hIbzV1SnRTSldIc0FiSjJWQ0tmYXZxKzJjRmhU?=
 =?utf-8?B?MWc4a0R4dVpnOG1pcm5BOUFJTnRWMHN2YnhTd1gwRjkrOUFQSkdmVE5HcHdQ?=
 =?utf-8?B?RVBnaVdsUWNEUzBhN09RTEFLMGU5NGJWSVN1VjcwM0pSdmdlQkVSRithSWZL?=
 =?utf-8?B?OFBFTWZidnZoMlU5VmFnRVVadTEyVXA1eTl2bk1odER4ckQrRVFxZm41amJF?=
 =?utf-8?Q?hBA6knfFkDy78NjIo2LfkSZzy45gXIh/?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QnpPdW95cWlaMlVicEJOZkFiRExDZzdadFJDRUdjckNyNjFSdUlhL01NRUxX?=
 =?utf-8?B?VU5XaEJwelJhUEJxS004dG9takM0YzkvaUcyZERUU285bmIxOWM5SDE2SEtm?=
 =?utf-8?B?QUxROWk2ZzdVUkhvdUh1cHc1WE9UMHBnT1htYlZUT1hlZVZQeTFtUmxYbjVU?=
 =?utf-8?B?M2pkV2ZQOU9UaEtUVTduQ09jdExGSitNdUJQQ1JjR01tV3p0OUZuY29wRDRn?=
 =?utf-8?B?RWphUjkyQ1RaM0RZQ0E0TnI0YW5MYTRPdUVVTW0vcHVodlMvL3FnSHk2Sm9N?=
 =?utf-8?B?RC9MTnE1b3JSWUlJbkNjSTVUTjA4d2hPd0Jra1ZHMy9DbWxhSjNIeDZvcVEy?=
 =?utf-8?B?eWxwVWIzTG83MVdhTS94dlMvUFdqK1QvOCttc29SL2FTSndUVlcyalVucFZI?=
 =?utf-8?B?ZGJMZ2dQdzZmRTlRWHhkbDEvVnlVMy9EbkwvOTBLN2tpSTl4aHZtRlZaamdI?=
 =?utf-8?B?dUh0VU5SelNNMFQ2azdPZ3BjNDJGTVRpNGFEVEJkNVQzMmRUcFBlbzFLOUpv?=
 =?utf-8?B?cWY3ZHhmUk5nUFpoelQ0bGdremdsbzNPeURFaERxRFgxVWtVaWcybVQrbDBw?=
 =?utf-8?B?dkZPL0ZMUG1XYTJqR05MZkcrWmlkdTA5THQ2c3VSOUp0cGE0cm5xNHM0REJ2?=
 =?utf-8?B?R1FIQUwxZE9mTitqVXhWMEhFeUtsY3ptYkdGd3VxYm1XeSt4UGdBR3RKOVA0?=
 =?utf-8?B?SWdYMkRWMVhWV0pEQnpkdU16U0liRmRMWTZWS09XSUN6aGJKNklnYjJqb3dp?=
 =?utf-8?B?bjl0ZHdLL2ttY1ROZTJlM0dsWjUyUmg1eVFNL2ZaT0NyM3R4QmVXRzhDRUVu?=
 =?utf-8?B?OWlubWV3WW1RSFBGbkVyYXlTeHBaU0JmL1A2MU40Q0xQL21VMDRQQ01mYXFW?=
 =?utf-8?B?OXBzb0x1SDNveUl1aExieUJXZzYvMnJDR293Y1VHT0N2aEorYUI3UkNJNTYy?=
 =?utf-8?B?THVnYkwrcEwwQU5vUmhMTFBRb3VVWXhKT3p3L2Vqbk1SamhIdUJHSXhQWHBO?=
 =?utf-8?B?L2ZtWGVLU0VBT2dMQ003TWw3ZEVPNUdUbExIbGVBSzErUkdyTElKRDFBcFZr?=
 =?utf-8?B?KzR1Z3Q1SUtZaG5GN2s2WG1nN3FDNTFEWVlGMFcvU0wzREYwRVNKR2dkUDgr?=
 =?utf-8?B?MkVoaFFWRk1zNWhmd3VOMXZlK0xIbUNiRUNMeG9CRUQ2bk1ZZDRwMkEvZXVY?=
 =?utf-8?B?ZmhVYzdFMDJPazJGNm5XeHVDdjh2aVlrTVFPd2dUNHptZzVtT2pnWU11dndR?=
 =?utf-8?B?NWszOFo3UDA2QmlINmRyckRFSEMyRFlZRFBnMjU4MzlyUUFwdjRMclNDOThG?=
 =?utf-8?B?STMrRGtFZE1uQmwrU0VFZWozdGlUbll3VG9nQnFhVlcwNmdncDJPRXpIUWxk?=
 =?utf-8?B?Z2NlYWZRUXBWS3MzbzVYS3loRC9ta2c1SGcrQ1dESDdPeXNzU1VLaWxSRGpv?=
 =?utf-8?B?Ymp0Mlprem50c3lURS9NODB4VjgvNGwvSXFHMWdUSVlNNUtKWHlldWVZQnho?=
 =?utf-8?B?bWtTU1dselg1VElVUHhrbGI2aWd6NHFkVXhGcldlc2JDRm5HVThuTjVtM1lK?=
 =?utf-8?B?UEtYL1YzbzVmUVFuZVg5ZDNGSnV5ZjlKbzBBRlJEbXBtdjRnRzEybmpvOVMv?=
 =?utf-8?B?YjhyVE5VRnJ4NmVSekswcVhBeTBNbngreDUvQXY1c0lJb20wTTZEL3pnS2xI?=
 =?utf-8?B?WU5CTHdpbVpmc2hhTWc5TmJydnhnUHlNT1JtdEpaalZOU2w5bUNCUlJ1Q2R4?=
 =?utf-8?B?ZFNNUFBSMmwvOCsvVGdmUkUrYmZROGtmcnE4eVlSMXR6SytlYVRTTUJ0cXlu?=
 =?utf-8?B?cEt5dlo2TVcwZ3hxYkt6WFRxTmh1ZTNzWkp2b0JyUlZ6dENqb1ZnOERPdHY2?=
 =?utf-8?B?ZFZJdGIwd2M5eDdYL21CRTZjK2cvekZ4L0dnSGpmbUFvY0RyS2NsYUl3a3p6?=
 =?utf-8?B?Z3lySGpPeHpkMVY4SExBWDFaR0k3NUZWOFdyYVphejQrZkx5TmFncE1PRkNp?=
 =?utf-8?B?WFhPa0J4VU9DZTl5WFNHOFJrNHp5UGZKM0QvT3JhYVJmTG9JWUFRcThqU05z?=
 =?utf-8?B?RHBTcFdXQkFSSjV5VUZ1TEV3RnFCUFZUV3N4RmRIMFhod2VocUs3R1BWOEdR?=
 =?utf-8?B?a3VYRkt0RlRTY2JBL0NMMGEzSWZScWJFV0NDTkZuaGhaR0RPbzluNmpzUFY2?=
 =?utf-8?B?Qmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9c8dd5-e09a-4c8f-2536-08de1559be93
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 13:07:13.0773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UG8EmBF5O6WuGKtM33mohIRCWTyDIHNgew8+8cxqt+k3g01IuLjQsImRtNRpIWZpPRvztg+0pikfyHYFiXE26EDZXvD8XT7vsrmx2fSgwGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11579
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 13:07:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7867

Hi Antonin,

On 10/27/25 1:43 PM, Antonin Godard via lists.yoctoproject.org wrote:
> This feature was added by commit cc91a0f6500e ("ccache: enable ccache
> for all recipes if it is in HOSTTOOLS") in OE-Core.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/classes.rst | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 638906353..4d0882401 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -392,8 +392,15 @@ file for details about how to enable this mechanism in your configuration
>   file, how to disable it for specific recipes, and how to share ``ccache``
>   files between builds.
>   
> -However, using the class can lead to unexpected side-effects. Thus, using
> -this class is not recommended.
> +Recipes (including :ref:`ref-classes-native` ones) can make use of the host's
> +``ccache`` binary (via :term:`HOSTTOOLS`) if the following configuration
> +statements are provided in a :term:`configuration file`::
> +
> +   ASSUME_PROVIDED += "ccache-native"
> +   HOSTTOOLS += "ccache"
> +
> +Using the :ref:`ref-classes-ccache` class can lead to unexpected side-effects.
> +Using this class is not recommended.

Note that since there's no newline between those two sentences, they'll 
appear in the same paragraph once rendered by Sphinx.

Maybe that's what you want, and since the rest is fine to me:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

