Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D08C4332F
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 10:57:36 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.57])
 by mx.groups.io with SMTP id smtpd.web10.70417.1670929052229519469
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Dec 2022 02:57:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=j9nUWdyt;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.57, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNLOQAy0B7F75r0cb1lnDgHQiHzLI5JyFAP9lfd69Qs2Du5qfbeRkeQT7lL1IFASi4jZlOngYVa6hhoO6TB6zmqOvazDbyFN2kvX9kI7TE/YIEODUnz2Xy8Qqwa/hd2PbjSBv82qoviJfIVRiVdv2y30+ZWVwhyiLuIJGeN+KYr/wzAjpadnomqb2X031Eo6KUC76WZ55gSaTRZyuUZIt2afQWH2FXbjzw6+owtdOPrgwozVp1m44SkQj66a0R2r8HPvc1xPk0gvX2i1frb4od5F8O6BSFxhdRu0n3HcPdL87era/V38G/4oI0nC5Niykv2D9ZXTpI0jLcEVXrvN7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07VNfa4/zvFPBGjwx7jmZTWWZOxUxaxcr6Fcr+5i4SM=;
 b=BbjF5yAzGElFENDDm+YGHuVAwVaVZfNX5Qo0JzUoZ4K/0CwlCuzwlsOjGxzZaL/ZTMXR8GCzn6/LvbDYEcs9/Q3TXbbQG6MDJZy8uW7xHYxCaDxoeEhXtcgNUhkHXSaZHW36WuUKTvtuyvNW9cDIeg66oxgsutVdYZpgyb8KT7CenZu3ZIP/eQxxMRqxDtxdyxoCNqE6FHA5RAcY/ro2pG5q+eD6A1mS6ycREfAZRLlwkeoBT77dPu6RKE0NB+nM2Qu2ijWKJjXbgD7KyDEkNpTzdYCeSY557trox4uLmVqzaImoO2cY/sbSoipYsG2VNw3uqLCje5GXxRE6SGooVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07VNfa4/zvFPBGjwx7jmZTWWZOxUxaxcr6Fcr+5i4SM=;
 b=j9nUWdytPbJvphrZoOG2QaS3fN0pX7LMRwvwg6/o9kiddHRyzYkk+8Sd2yvz2tWjEDGYdJW5PpKf7Rrn69N5vm5GVRvtdP86fOdD4fy/s7Mz0A3AuF9sgqZ+ampsfkzftlAozT1AHm5msX+fIutjNUfh5fNI80Fc/eylr7FphPvwdn6RD42+nOcSmCB1Wi8k3OySHA3HHQ9SxIkMGZVUCX3HI6BfEACXAgZVD82nbmAs1zbBm0BsspKZt42johUCPIxqsMlUHhe/1o6/5+yeAhRh/O4MZqEz+xo7uUKbSY+EAmN2c9jPL/5EoUBulBYuLBssbRV0q7euRUJ9fH71cA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PR3PR04MB7307.eurprd04.prod.outlook.com (2603:10a6:102:84::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Tue, 13 Dec
 2022 10:57:28 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6%7]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 10:57:28 +0000
Message-ID: <296e7280-83fe-f60f-a95f-56585a443c11@theobroma-systems.com>
Date: Tue, 13 Dec 2022 11:57:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [docs] [PATCH] ref-manual/resources.rst: improve description of
 mailist lists
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20221213095859.135895-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221213095859.135895-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0902CA0035.eurprd09.prod.outlook.com
 (2603:10a6:802:1::24) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PR3PR04MB7307:EE_
X-MS-Office365-Filtering-Correlation-Id: a0686e77-3ac0-4250-3d40-08dadcf8d2f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GFTApysrkjzyx0q2AlU0JFBSBOGLMgPDuB9D8J5uWdo0mtK5ruFblCAg9IM+V/0bS/I5QBAOMIOmISh8BW9WXXTcPmadsUeyx+5h0enp++uj1Szhnb73oUECC6ocuHSugpNPVB0BUkSMvbg1BOQhnwY5TPE2afwc4YtmYk8CMoPD2mPAuS82O6c1MnLaWVEebocjNSL4UYVfqC47WZAsEHXtc8al8KO+do0KtExyx/ydX4VtCm8cLFvrDA2tRXaNmbdqzDcQbIDR39m3m17gNo/SK4p++5yYqfV7FT0RoweBMnE/fyJ9fPTWWVxmr1HjgPbbFUC9ssZ0g1/OV1R34Vh4Dpry2EpKGVeotyOOGPKa0QVi7pZ8N4igoWh2DqqlCTVVOyLznmUFsmn+0JClbiI/QRrYtiYC+xrkeHlxv814QI3/acBcNp1TzhL54NqBf5llOjm6+/WOgijqZNVPkt0GCivuIXqXM+iYN5M7PezBp7Aa0sODltNP2abO7pgDZ+PXmnxmxnBd9ge/Pl87354Fdd3gMiHiPzdCbZzscS3dPr0LC31vj6CbODGcIq676jBNI8eGi/HanZ9Rh5f+AQpduWGrTRZmNuTFowPyj2St7Iw1TgeMTF7rFlCe3Va2/JXvlEAGEjD1RhC+ZQcXaIFTVBoYO4y5adpzNDGVcILs1M4n5BYvTu8Pi7HaQS58gBTdj2szSkt88V/pULXUa9J38aBe+4N8pA9WZQ7QM2c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39850400004)(346002)(396003)(366004)(136003)(451199015)(36756003)(31696002)(86362001)(316002)(6486002)(478600001)(44832011)(2906002)(4744005)(5660300002)(41300700001)(66476007)(66556008)(8676002)(8936002)(66946007)(38100700002)(6512007)(6506007)(6666004)(53546011)(2616005)(186003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YnR1VGlqNFFzUmR6ZE5Qd0Y4TU5ydXRXaVRyYjVjU3NnbTNreGc5U0FVNVhR?=
 =?utf-8?B?Q1N2NkRMTm82d293bnVpNWYyc0ptSHlWVlBNMHhNRXNQc2lsWWw3by9CT29D?=
 =?utf-8?B?Rm9TT1AyV1k4ZWFlMHUya2IyRmxNVU5BeXdNSnY5SlJlcXZGNTVWQ00wN2dG?=
 =?utf-8?B?NmMwQ1pvUXlBVDIybG1uY2hEQTY4a1JCbG0wZFdBUHVuVTJ5Q25sUE1qQkhh?=
 =?utf-8?B?M0JlMnI4bm1SRWV1Ym40Qy94VDdhWEJpOW1PUGI3SHhhTUFEMExER0hzdVNs?=
 =?utf-8?B?cG1MVmhWTG1MVjkrbCtYZzkrU3c4Uituc3VwMkZxMlJPU1RtbnFZVXRzcW44?=
 =?utf-8?B?RXFmeFpBM3MxUS82RXliQjJnZmpYckVwVlF1TXk3aHlrc3k4MVlFUDk1R1B5?=
 =?utf-8?B?NW81MGQ3M3JhOG84bTJsamYyYkIwUEZtWUoxakRBd2J0YkZZRkwyU0p5b291?=
 =?utf-8?B?b2VYNHpIYUtsWWFlV2M0aTE0d0puaHN2d2NGMTU3WEhvUEpjV1hZZmNSQTFJ?=
 =?utf-8?B?VDdpTXU4ZWFkNlR0ckllU2NuVW1ET05xTXEvSDBUbVNnRy9Vam9EdUdUdGZY?=
 =?utf-8?B?dEVLWnRRRUpRa2R1MmlpK1Azc3lqVnVSVEtPVHRQU0VwZVpSdjBKTmN4VlZz?=
 =?utf-8?B?ZHhGYlBXVlhwRnlxM2hFaUJOaHpCSEFRZ3dNMmpUZlhPYlViMVVuMlozYXRo?=
 =?utf-8?B?VmdsY3AxQUtMWXp2K0o1WEljS1hlM1kxVER4aTZMTkxURUYyV0hDc1h6VUND?=
 =?utf-8?B?cVJ0dXBGSlJES1FoRW9majV5Si9PakVyRG1QMHZhNXN6ek14VGxNbnJBR3ov?=
 =?utf-8?B?dDJsenhzT0U0ZVRnWXBsWU1wQWtOU1R5aUxvUDZBY0V3V3FvY1dJZWNPZGpk?=
 =?utf-8?B?QWZ3Y2doaTRYUmg0QWFTdnFFVmE2MUt5Q0dEUzA5LzBiTDJpTGcwL0JpRUR4?=
 =?utf-8?B?L3BuNjRWL2RIdWFjR2hnbWxKZWg3aCtnSWtudlJ1Q29ndkJtOE42ZHorbW5S?=
 =?utf-8?B?QlBNMFNjVHR6bDlDb2ZuT1ZZeVVzSTVPTDFaM2NabHl3NFkxWXRHRkNrKzBo?=
 =?utf-8?B?RDVid2FraUNiMVI3b2daTlRsdEhSZndlZjJQTVpKWGhxUTd0YTQvMXhFemVL?=
 =?utf-8?B?WGpvbHc0UEQ4VElwakVBK1VqMmU1VzBGNXo3TzFRMk9qL3hKdGRNWldqT2Ju?=
 =?utf-8?B?QUo1cU5jWkpDK1RsYkkzNWF6MTdqQ3Y0bnBuS1BjMDc5L202UE5CbENEelFq?=
 =?utf-8?B?a3U4N1Ztdk0rb2tFUjA4VlU1UXJBY0R3SGl0bDN2eVNLMDE4emk3S3k4V0pj?=
 =?utf-8?B?bU5JY0JTbWZ6Z0M3NjUyVGdKQy94RVo1YTF0WHJnOS9KYUhJQ0Evbm9pUFFD?=
 =?utf-8?B?dU9WWkQ0ZUVucndqUllKVEV4NkNiRy9yRUErQWxEZzNvd21PVHE0U3FHTXFi?=
 =?utf-8?B?Smt0UTJnWDl6NkFYN1RQZ3JMNGxUdThTSE1UZnhld1pEVXV0ai9iVHhwb1hI?=
 =?utf-8?B?akZFcXFHQ25wb0M1RGtyVEdzOW15TE9BRHova0Fhb3dGV1lmNXlZZTdCajFY?=
 =?utf-8?B?Q3F3TklaUXU2djRWWUxUYkwzSHc2QTZxQld1cjVwMWdwTFM1eEQxYzU1aGJv?=
 =?utf-8?B?WU02cUJ4djljN0twM2hsRE94YVlNM0FlNXd6ZS9Mendia0lYdUNBSHFva1Y2?=
 =?utf-8?B?RElzUkdOdWg2dGtpYWdZTEk3L085SUZnajRLdkZhWGlmVUNVaUpEOUVaWk5t?=
 =?utf-8?B?dFptT0JTWUVGWGJ5YkNwazZwdjNCeURqaTNOWnpNT010ZHR4elBBb1FjSjhR?=
 =?utf-8?B?VlpDVDlSNWtWUGluUUw3TnNORENmdG9sWE9Xa1JxSSswLzlWL3J1ZlNvYjdC?=
 =?utf-8?B?a3VNR2podDRiNzhGc3lxTllOU21EN1MzRXRjYmU1QUorZEtuQTJ3RGhwSGRh?=
 =?utf-8?B?VFhMdWdZMU5obG5RYTJrQ21PTUVZOTA3dGNUZ2prcnlmVko1bUdnV04zYjZh?=
 =?utf-8?B?YTF1aWpBZVV6MTRDQ0taWmFqWjB3TnJWTUYweTNpTmI5MjBCNjU1NnVvNitr?=
 =?utf-8?B?ME04SFByMEFjanBUNG5RUVRQdm9MeTc1VHRQYjFBRlJIL3VwMktPT2djT1JX?=
 =?utf-8?B?M1BDSCs0Mzc1R3dCZGN6SHZJcEVqdUpTQjJyclBXZ0RaM3JZNjhQV1MvMlp5?=
 =?utf-8?B?SVRwTEZaUEtmNzV2YWZsN0tHeG1XM0txMk5qSEZHSmpWUHArTjZjTE9PODMv?=
 =?utf-8?B?bmNZS3VOcHl1dkVjMzVrSVY3VkF3PT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0686e77-3ac0-4250-3d40-08dadcf8d2f8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 10:57:27.9267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tRVNm2NfoS1L1kdtsNxE2f2R4irsMCUcx6L/EHFejs7cPeiOb8C9Wde+9BaOBRD7x+GZb4WF6JWC3F+yxFpgpUa/XPfx7KMnC5E8Ol8ShytceInIHdTuggGFycLUxhcP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7307
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Dec 2022 10:57:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3552

Hi Michael,

On 12/13/22 10:58, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> - Mention docs@lists.yoctoproject.org
> - Refer to the specific web page about all mailing lists,
>    instead of just the website home page.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Thanks,
Quentin

