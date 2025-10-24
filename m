Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 929A4CCD1BF
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 15:07:11 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.50])
 by mx.groups.io with SMTP id smtpd.web10.13543.1761318421426976120
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 08:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=QzBt0/6L;
 spf=pass (domain: cherry.de, ip: 52.101.65.50, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yzHfdqGyNjmYaIn4QYnI859IQgyJUXlqHsPvj+oWUGFjfUeCfLa3mPw1dhf/4GtzWPX3N6ViE0OX/Lid681FXI9/hAm16b5L3KGD/GvPvD0yi2IOmJDmpV64zOhysoY3rEXTglpk/S9m8KR3tyI0FjzpfrrGCyh7zLoPTY81rEKf9OdgolKIAgbtUnWrzOLD8De6nSUlhKoIOWwSywOxWCHGH3uxc4Pu2eN4ePuFZvlje/+Z2Qde+4M4L//wM+pVgqNTb8AAgjr03skRLKr8pmeYrGJe0MJRDYB7Gm1cKz7N8kRs21lBJ39IuKrhXqRBPUcPor+bnZPAIFZI8jmfvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYXFTQqgsAMKLfwgrTHqcECD/8QRHP+kR+6uFqHxmFo=;
 b=r4YL37G77SleqTFGzwND+TGqJRATjUDi2aPBqsSF+eXion/6z4Lhr0W7mlYmHjT1amMOGq+tmlSCpcUYs2Vac3mcc81sLc78BcCBcJryYpIW3GoP6+B8QJJYS+t7WFBEyvkH8Y5NYYvnckpt9d8HFL/uVKW98bpDLV10PwyRGvRDc01Yf7leW+0JPH5jqOcbifUp6hH7wkj8f6lihiz+HT4cg2xgL9ya6+/m3m/85HXg5vNzJd8IIgyNPvOMmd90Zkoh5rvxGxbgpX4lrpP4tRM1IzGlTBCqA/TRR3Dk4Gq0obkqGxxXDvj5bCjD+Qfjro8NpqqpKQqzSvbe+GPSkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYXFTQqgsAMKLfwgrTHqcECD/8QRHP+kR+6uFqHxmFo=;
 b=QzBt0/6LEjOCVN0EWH9eo+yCcj2dq4du5zNugo0FbMlZcaSMJdRFhtYqfEDutqQF0dLa//XPoEtqIb0YS3xjREvpbgtax/nwu169lGsSAahbnOXY7ivBvTSt9OGv2uMXbzEgzAOiwAXwZ9Zrymb742/xYpjQfOk6L0tD+9VvknM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS1PR04MB9333.eurprd04.prod.outlook.com (2603:10a6:20b:4df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 15:06:58 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:06:58 +0000
Message-ID: <75bb84c3-429c-4a91-9b78-ce6f23d446bd@cherry.de>
Date: Fri, 24 Oct 2025 17:06:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 03/16] ref-manual/classes.rst: document the
 python_pdm class
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
 <20251024-release-note-5-3-second-hunk-v2-3-d15dabc095d0@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-3-d15dabc095d0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0214.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS1PR04MB9333:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d64233d-96ad-418b-ff62-08de130efa10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L2VQR3l1MFdSenlRekFoOFlrQlZvNFhUeGsxQVFYV2xSMnpNNmt5c3NYekhR?=
 =?utf-8?B?eVdERG1VdnRQTWV3M1pRNHVOc25vMjhTVmsxMU5pSkFTcnNHNGhGeEF0QmJW?=
 =?utf-8?B?NjJFZE5zOGd2aXdwQlpiQVdsSERXczdnblZ2ejJPQnJxTFZGRGtBcG5OeHhy?=
 =?utf-8?B?cFdIZ29aSFArNWZPVHVueG9OcGZUWkNzanMyNFpiaEtHaFZXajZ3VGJMRTN0?=
 =?utf-8?B?UVdjZVBWRXlKalFtbmRBcUJjR1BaMEI3YW14YnZCdXQ4TDBZb2tTeHBtdGt3?=
 =?utf-8?B?L3JTWFZOU3JkME56b1NMVEZqSGpEZTdGdmJPTXZ0bHBpelJxVlAvTHpvd2px?=
 =?utf-8?B?N28ya3RIeVdpZDFHNXJ5Y0hwczkzZVpmQlVJRDkyTkhhKytrcGlIV3labExz?=
 =?utf-8?B?WU5rOTNvaFJSc3pzL1FidkpJUXpTb2twZWpPUWhxVVBKU1oxTERYT0hrYWla?=
 =?utf-8?B?YWg2cnV3d1E0SVNVbjlxeGFrSmVBcXFUanM4bkpPQzdSU3BrSUxsSjdvZ2xO?=
 =?utf-8?B?Z1ovUjhJd01zcHNGTDROcnJwUFFxbDMvZFRZS2JMTUJJTjN3ZUw0S1EzSUNq?=
 =?utf-8?B?RWUydVRxNlk1V0JzZXRFSzV0RGprQ2NYQzR0Z1NsOTlqb2luaXRjSU5vQ0Qv?=
 =?utf-8?B?VkRFU3U2OWM1WUtpcEt2d0wvSG5OMGdyd0FuMnJWZzdveHB0dHN4aWMwV1lp?=
 =?utf-8?B?SHh1RXM1YWRNeGdiQnhYTVpEQWgyK2JMTDkvbkhlN25KMUVEQW4rUldVZ2tM?=
 =?utf-8?B?bitQaDR6ZTFkdzVPRklXcC9SeE1kUzhmTTFsYWg2cDVWT3NhT1UyMVN3L1Z1?=
 =?utf-8?B?NkZuMXV0dWxaRGhxckFOekdZK2I3S0ZlT2crdnIrSXJDVC92OUl5ZE9wUm5F?=
 =?utf-8?B?QlhlQi9aTG9kd0NGZ2xHRGloVGx2M2p2WENFQ21yMjFRY3I1Zzd5aWlBd3Ux?=
 =?utf-8?B?ajZ3UFN6OWFMMkQ0MXhnSHlDWTh1dlBzWS9UYVVjek8zc0RyTEN1bzdSbmtp?=
 =?utf-8?B?SithVkdxMFFUa1ZHMUhHdVJIVzVEZXpkSFR2QUlVRDdQSlMzRmZ0T3ptUEIz?=
 =?utf-8?B?bkZ1T0VwZkViNEtHV3YzcklzU3ZybklaaDRxU096STJWTEVkT29ERU4yR2R5?=
 =?utf-8?B?M1FsbC9RYWZqckFoUldsNVVtQjI1Wkhjc2R3Yjl6UXFiR2txL2JYOWFYUzFy?=
 =?utf-8?B?NFlhcjA1d2pkY05TMTZkM3lKck1idDBkKzhJZHlyNzlBRUNRNnh4TFVkNTIv?=
 =?utf-8?B?aU11c2FHclUzbytEbjNhUWt1UW5YVlgyME9oVWlndkJQeFlrWS9VaTlQUjdV?=
 =?utf-8?B?UDhFS0NxZW1BWG9LdG45ejQzVEVaaUJIL0NQZmxaZVhlSXpTMGRaZmJIY3hr?=
 =?utf-8?B?bVllZzV5cFIxTG9PSCtqVUlvNWZhYmdVTWFCdjRrMm8vdUF2ckxtc3BDeVg4?=
 =?utf-8?B?b2R1b2Iwa1JhMVQ4bnJRNC9mN2JMdjB1MUM0cFJwMm10ekNtc3MvNzhuS1Ju?=
 =?utf-8?B?bStTdmtBZjJleHdML1lZN1Q3eTVpbWplU0FNV2tVaHYzTmMwSEhZRThYeDVO?=
 =?utf-8?B?aGQvdHRXZ1ViajNNdXg2clBkY3FTOUtvdHdpc2NuQS9PdEl0dWdtUjA2c25C?=
 =?utf-8?B?SVZKRVhmcEFLd2dmL2d3SnI1dzRsUE9EejVhRks4VVR3MW5JNzJIOHRZeFU2?=
 =?utf-8?B?WWRDbElrMURFWUJmZjZUZG1oZDQyY1VDeUZkazZaY25kQ3lpVmQvdXFLaXBs?=
 =?utf-8?B?U0lWZVhGakZ6SDQveDY3anRQblYvMCtKWVR3WnpwT2l1RVlkbm42WWZPWFFP?=
 =?utf-8?B?d2tjZFZRdzZYdUNWY1VZaXUvay9KZjhOcnhWeW9IUVRqenJKTmlTRjY0anZ4?=
 =?utf-8?B?WjBicU5VNm1LeVl2aG5ueDMxMEtmMzUrKy9tNmpPYW03VXc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N2RkcGVjUTNOS1Qwd09qMWh6NmlKSldLNTVOeW5YampIVHJhcHVDMUNWWFl0?=
 =?utf-8?B?eTZzT1dSRUF0VDM5NHNtbFVubkx4b3ZmWkwwMDFXa2Rpbnl6OUlVWHZBeEds?=
 =?utf-8?B?c3N3ZWtXVDRBRVZBY1c0c2lJdWhsa3lRc0FocmlyNmZIME9HcXBQMDlMbmdz?=
 =?utf-8?B?VnY2bkxkaUFpdlRsWU9BM1hGZWxkVXEyVXVxOGFVbnpqcGc0WFRoMDlVQjhw?=
 =?utf-8?B?WDJ0QlprQi9iSzlhYWpnTW95dWRDU2dqd1Q2eFlWL2tWSkU3TmsrZ1Q0a0M5?=
 =?utf-8?B?UWQ3Z1NLMlp1MHZjZXhybUxydGliMGdxdWJCSU5xVWF0UmpGQVBsRnNvRGpp?=
 =?utf-8?B?elc1aXlnVWRwMk1BTDJYTktMRjdVKzJWRG9jdG44Q1VMdlNhc2JpSnUrZXJF?=
 =?utf-8?B?c0ZpdVdMcGhFMUFBU0k1bnNCcmZ0c1JieHZtbWlRTDhwNUJ6K0ZydDVwei9I?=
 =?utf-8?B?blZDWUZzUjhnb1FKMnRJcGk0bzN6UmIrdWpDN0RzQ0xjKzZWT3BEMDF6ZkM1?=
 =?utf-8?B?NzVJVXlPeWpmc00zd0NXWnVCVk5Od3lsSXZGSHZvMTUxRWM5RGFEdlVzc2JK?=
 =?utf-8?B?bys3KzRVNG1LeTFKS3FiOWttRGNqdGFmVmpQOHAzOUlGMlJYbHgwWTFWWlBk?=
 =?utf-8?B?bGduU1JVUDRpbXlpN0RZdkdDUTRvZ0xVUmtjVWRVd1FiaC9sMHBPTUNEUjZi?=
 =?utf-8?B?d2MrS00vWXIzSmZteGVjdWdvNTlGS1FzOWp2anlZN2x1bG92Y0FrM1E0bGEw?=
 =?utf-8?B?YXZHSnJwOGFLZ1Vwak1GZ0NrOEJ5QUVKZ2tBem9IVUtzTURSOW1BaWRUd2s4?=
 =?utf-8?B?WGgvdUE4RDFXZTlCV1lha0lubzRuQ0UyM3RvWE1UN0R2S2VzeG1QU3l6QmRT?=
 =?utf-8?B?WWd6K2FLbEVGVUJaaFJkZnk3ZDVTRzBGdUw3U1g2VmpPdGplS3EwVGlYTmtB?=
 =?utf-8?B?ZmpXZ1JTTWVTVTBPTldSQTViTlBvckVhdnpKL0dwbHFPQkFoc0NFMG9XZVcv?=
 =?utf-8?B?Y2NnbjBITFVCRVlqQUVpMUdkYndPWnNwTWhzaEFuTW44OThFNXY5SDFCY1A3?=
 =?utf-8?B?b1FWZFlJQ1ZQdXpqakpDajJldURya1I2djNoZ0hSNUpxZm5jbm9mZG9ZaTBu?=
 =?utf-8?B?a3VZNnZxRFZJYkl6dVRZMjdEM3ppOGlsZGRSS0wrN2VkYkhDck9qSTNCYW5w?=
 =?utf-8?B?MUhETEpzdDRUYVJUdXV2WmdTUGFYQ0tacGJnd0JXWUh0ODZkR3VxeXhWTGJ1?=
 =?utf-8?B?YXpBUmMzRW9wMVVpNk1FZUd5NzNoUjhya2JXM09LQWxHSjRvd3QvN3UreERI?=
 =?utf-8?B?WWY1RDNteGdEMWJaQmZQWjlPSFl0NWxXbDJDVHl6bDZyL0hrelFhSXQvRk5v?=
 =?utf-8?B?dWNFYmd3NDJpKzU0YnV4MFp1ZlI4Q1lmWE8yVWQzVDh2TlA0ZGRVY29QNjRB?=
 =?utf-8?B?eFMzczlHQ3ZnK3Nud3VnRUlJb3ZYbjl2V0xyMFAzajZoUFM4Rm5LTktoS09Z?=
 =?utf-8?B?WmozSzNJanNWWUt5WlVjcDdjZVhCVXJWM01na1ZrTWdEQ0hPQUNZOWY5M1p1?=
 =?utf-8?B?b2tneXdqc3loN0dLNFFGYWRPNXNoeFc5SDE3TDJqRk40U0doc01NY2d5V21m?=
 =?utf-8?B?b2ZXNitYRkh4UDlqMTRiYlFvOUlHak8xeWZIRy9ZYk9rdXI3V1JCUDIrazJR?=
 =?utf-8?B?OEpnbGQzZ0tnOWpzbWpFRGxiQU1DNnRJNEdGMEZyVW1wRWtSc2ZnZHlkclNB?=
 =?utf-8?B?U2tlZnByVDhkalpUMHh4SmdGanRMV1psc3ozVVJrcFpodHhiczdXT3k2cjg3?=
 =?utf-8?B?Y0h4S1o5R3NmOGNDUWZ0U2dqMFhJcmFiQ0lCMFcyMmszbUY4MWUrTUNQR1FY?=
 =?utf-8?B?UmlUSWlGRjNkVzdmUUxCSWg2ME94bFB6QVlubXI3d2RpT21qUDZ3MlhxY3lG?=
 =?utf-8?B?b3RpZDJ1Z0tDUXdsTE93MGx6dnZpR1lCblE1Tys4QUQ2UnZ6ZGFuM28xZE42?=
 =?utf-8?B?Tlk4eGJ2bFg1dG9OM0p0Z1dJL3NOaUVqVnNtMWlZY29KVXo1cU02ZVgxUEU4?=
 =?utf-8?B?bmFUQzlqNUNndnI5V3RsbmxWeVFTdVJMNFBzVEM4L3JSbkI4QmRRa3hkMG40?=
 =?utf-8?B?UmVhZkhiUFYwNk5vSlVoNDIxNGJWdDNmLzY5OVZmQzZrS01aczl6b0VuMEdS?=
 =?utf-8?B?cWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d64233d-96ad-418b-ff62-08de130efa10
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:06:58.0457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7sjwVNy2+III0GnA7a9i21ccgp9luvHqnqCXKjmtqk74l+33vVSEoe/yWHPc38qp12jHJgtDhn5fcVbqJyt9B64R6ABsfnu4IPlNiKT40E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9333
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 15:07:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7825

Hi Antonin,

On 10/24/25 10:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> This class was added by commit 20758865e9e0 ("classes/python_pdm: add
> PEP517 build class for PDM") in OE-Core.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/classes.rst | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index b92b9e28b..f93897be1 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -2174,6 +2174,16 @@ meson-python build system.
>   
>   Internally this uses the :ref:`ref-classes-python_pep517` class.
>   
> +.. _ref-classes-python_pdm:
> +
> +``python_pdm``
> +=================
> +
> +The :ref:`ref-classes-python_pdm` class adds support for building Python
> +packages with the `PDM <https://pdm-project.org/>`__ package and dependency manager.
> +This class adds  ``python3-pdm-backend-native`` to the recipe's build-time

If you want a visual newline between the first and second sentence, you 
need a newline between them in rST otherwise it'll be part of the same 
paragraph.

Considering the flit class states that it internally uses the 
python-pep517 class and that the python_pdm class does as well, should 
we specify it in the documentation as well?

Cheers,
Quentin

