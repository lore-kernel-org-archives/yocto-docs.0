Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A99ACCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 15:00:01 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.5])
 by mx.groups.io with SMTP id smtpd.web10.13365.1761317996876003543
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 07:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ULqA/FKe;
 spf=pass (domain: cherry.de, ip: 52.101.84.5, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wK4EDeHOqdOb9v76s2uJjdTv1xhPahKiyBC8aKS++2qToqaozEZuqLxhPB98MY+l/omuVYNB9gg0StvJLAlZtSQIBTCv71+OkSVF5ziqetPR9NHlf6prpoHk9anI/VpS9CQNVMlEgbO91/spBCagkkmYKj4C1NFi2a+O6Jzb9bsg3GO4PQUtuB2TQitfnoQEGJ/svmpU4Vrd91Q1MAXFbOUHGDpIjgrMiNCjzSGIWfPnfKQF+dBQJ96R3YmEfuoWVfVS58cKBow75LSK9JYNf2VfoPXxv6IpUBM8q/Dmz/fXPXPo6mIUU9QxTmYS4yPQi5/1taWUjyJoNfehnZeqMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K52Pm5VDf6AhDPEX8O9zUwWGdFpMtfSO3SqOqVo4wnM=;
 b=l45VkPX17qWTyg08jo7sDE4zAiju3LYsPcV1mSm3E+0+//d+hma5MRrRptImM8KnFeIACVjtxCQurbMbkaJl/+Y1yjkh6sLP0LKJOpoCQDEJU/t2xyWuujr3XjE6rVTxhiQuw/ypfSpm6/XQ6MCMeB1A1MPAj8IAilBYRjWkGgx9xu3p453oRrODBl751BvV0RDclKGXLh9uI5MNZ1VzuHAiY7N/jikysw64a6brducsDNosZf1V23oM3BW6LqBcPXz21oTHtpmJUvjDnYHs8Zif/gNTxbdv/Ex0/Rn084eQ+9f+Fc5vTDbtCnP0JHFzlgXzgVAO6RGYKZfZbnSjpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K52Pm5VDf6AhDPEX8O9zUwWGdFpMtfSO3SqOqVo4wnM=;
 b=ULqA/FKeFZeyR+nxm05DIpmekufjYcELtbaFHp4f4udOnqhINZyi4RQAcORK9at9L9eMpBJLRsIJtmNUiul8NY6EKHG+0/yfw6D7jetfhVXOXXeNHaCsWQiYPlJdXbdwBI3Iwt4o8C2HHR+EP2426XFIZUnmnuqZcmnt7hQtaXA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA6PR04MB11806.eurprd04.prod.outlook.com (2603:10a6:102:526::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 14:59:53 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 14:59:53 +0000
Message-ID: <5bc6e052-5239-496b-9272-c60c14b8ff3a@cherry.de>
Date: Fri, 24 Oct 2025 16:59:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 2/2] migration-guides/release-notes-5.3.rst: new
 wic extra_partition plugin
To: pierre-loup.gosse@smile.fr, docs@lists.yoctoproject.org
References: <20251024084446.1109145-1-pierre-loup.gosse@smile.fr>
 <20251024084446.1109145-2-pierre-loup.gosse@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251024084446.1109145-2-pierre-loup.gosse@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA6PR04MB11806:EE_
X-MS-Office365-Filtering-Correlation-Id: a2cd9fa2-1ef0-499e-58df-08de130dfcd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TE5CcDd4UldNazcvRHBTWVo4L3MycldqZC9OQWJ5SFFOZTk3OHpKT1Z4Q0VB?=
 =?utf-8?B?ZVZiSVM1Q0YyK1Q1NTV0bGRYbmtyelBld2RMWnVQOXc5ZTlJZjFhTUVuT1BK?=
 =?utf-8?B?dnFBYlhWMCs4WmhIZ0U4Q2xzNEppRFJVa2NZSGl6NmlQcVNzdVl1UkpVZUJT?=
 =?utf-8?B?akFFSzRqeERuR2pXTWVzNmI3bFRNRldBWkUxdTl0ZlJaMWM4aDlsVHpWeXFP?=
 =?utf-8?B?YlhmYng4VmpOSit5YmlnbTVZUzFzSVJBQlJGSTAxTFZVcjJnandpeThlMlpP?=
 =?utf-8?B?SEFlWU11VnM1bnBGZEYzaFR1NVhRWVdoSmxybFczQ1ZBc3B0dzd4SmozWmFj?=
 =?utf-8?B?UXZHYWs0cW40emxwNS9zT052MkZmV3NjZ2h5SEE4cTNSOWVNc0pUc2tiZzdz?=
 =?utf-8?B?MUErYzlibUE0eGcxeVovMGcvR1QvWS9rbzdDSHNtRll4cFFTUkRqVTkxR2xs?=
 =?utf-8?B?QlUxV0JSc0NoMXY5NllCUVdWbzE4SzFKQkJIdGs1bzFwRjVIK2hFZWFsQlYw?=
 =?utf-8?B?NWRzU01UVGd0Sk02RWU1OUlZMGlUZWFNRXpEWENoYTF6SjZWY09XTDdHZ2Jz?=
 =?utf-8?B?WTZrS3NWTWVnMDdFeHhsR1hubEF2TlBDRVlKdjRQZkFMcW5CdXkzUG1UZzdz?=
 =?utf-8?B?blIvT2RrTzdvSzdDdkIyR0JZOVZEbFBucDVRbE9FWVRQY3dsU3IrWndCVmRm?=
 =?utf-8?B?SFF2TTdTQ1Y0OS85MlRWRngvQ2Z0WWhOeW5RRHJpWVY3MWI3bzVMV3F4bEw5?=
 =?utf-8?B?enZrVTVPYi9vd1ZDMFhyRWZCM3Z5UUpRVmRPazNtbzF4OUg2VEZHWVVXd3ZC?=
 =?utf-8?B?aDZibUQ0NWtEMEJFVEFZWFoyTnhpcDd3eWRLdVRnVEd0NGpOelNGT1B3QlZQ?=
 =?utf-8?B?WkNqTEZsNXIxOXlyWTl6bFNPZThPcXdPQkNwYkdYVnlzNUwrTDl2NElxVnJY?=
 =?utf-8?B?bytUODhLMTBiV1BRbHo5ekQ4OG9PKzJSNXB4c0ozbkVLd0dQSXVtZEw3TWcx?=
 =?utf-8?B?YTJIS0VBVjhBanNZZWIveWQ2QW9USDBtaWNibG9iWUhMbk15alByZ3ZGelJX?=
 =?utf-8?B?eFR0Z1I1MW1yaVlSekJHejVjdWVLOUpITkxpaXFYQzFsZkRpVThhQW5mbC9s?=
 =?utf-8?B?RFRYQTBPYTRrdE5FYzcyN28vWHVHc2NIQ1pXb2N2dXNGZ1huYjM3QXQzMXg1?=
 =?utf-8?B?Qmt6S0s3QWxIelIxdGU4eklBaDFLdmxPc1RLcnBtN1pBODBaNXFqQ0RDL202?=
 =?utf-8?B?b2piVzdXeW5QdGJaV3NkZFRPeFVrMkJ6YVRHUlo5V3d1VXRoT3YzeE5ZQ1Rl?=
 =?utf-8?B?OFFOSHA2VnpzUzd6UnJoV08vS3BjM1ZPRkY4Vm8wVTZMUVdrdmYxbWlURzY4?=
 =?utf-8?B?blExUWVZLzVBODFDSmc0SnFmN2IzdGhqajBHL21KcXBRVnQxV1h3SmwrUXlQ?=
 =?utf-8?B?NWtFeVlOTXg2QzRCT3pLeFk4Um93akhDR3p4U3FxWVA0UVJrWmlWRUVPMHZ0?=
 =?utf-8?B?ZXFUU1FLUDdOTDlsNG1sS2VtMEVpaG9BZzRzZmdydUJlekd1bVgzaE1RYXdV?=
 =?utf-8?B?eXF5SVkvMFZaZTRHNUYxTjlZR1p4SnNUVnN5Q1Fyb3k3aVJEVmVuM0NTRVNp?=
 =?utf-8?B?M1ZtYS96RmdZejM3eUxGTHk4dTN3djlETXc0c3cxWjJvRkZUaGVBc0FadXZ0?=
 =?utf-8?B?N1ovYkVDYzYrQlU5ano0bVFTcTRnZndnQjR4dldodWtlWldVVWZGM1VXSGJS?=
 =?utf-8?B?TmNSVlBVazFPY01xODZ5OHEwdnpHbWFMNE5EOXpoM09MRGthUmhBeFV3YW9O?=
 =?utf-8?B?MjVSV2ZrTU93RmtyTk85R04zZTcrVm1rMEtDQXJnVkN3enJzcktWRzBwNGhY?=
 =?utf-8?B?OWhPWjJ3ZnRwZzM5azRTNHZLS1lNR3BnNkw3dEhFemM3dmMxVmxmcUNSd3E5?=
 =?utf-8?Q?jAdZMFkYs7YVK/faFnVCMaD3RGWMmI78?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UXA0OUQ2S2pJeDJxZFZRMU90MkgrVFFwQ1dZU1BKelVQOU1oZ3ZXZ1pja1Jo?=
 =?utf-8?B?V01yU0t2dTQwV3hDcElKTUJDVWpseXhJVTQ2VldWUlJWUW8zNWRBd3ROR2JF?=
 =?utf-8?B?STRxQXdvUktrbTdxY0VrTktGVVduM2F5WHdDbTN4SGVRbWRuNVpPSSs2eUk5?=
 =?utf-8?B?U1ZYUmNhTG94Yk5qOFlYMjBVZE91Q1Vsd0RWWnBUeGJ5NlpVRVJEN0RtT3BV?=
 =?utf-8?B?WFA1d2sxYXZaVDU2eXEvY2g3Y20xdCt6cFN1c2xyRVUwOEFhZnpXRHp1ekZZ?=
 =?utf-8?B?eUo2YWoyQ1FVaDQ4VlhsaW0rTy80TDlQUE51R2NuQ0QwMityeW9iT2taWG1E?=
 =?utf-8?B?bjhFTUVYZHF0aUs5UGJHVGt1UnJqRm54c3NCWUdFRXoyVGhndWxrSmhEeXFw?=
 =?utf-8?B?L0M4K0NLWDRob0ttWko0eXYrcXVZbWQyZE1zYnZUSVgxN2txWEd1S2t2eUhm?=
 =?utf-8?B?dzVJY2F5Qis1VmlqbGF3RzdwRlJXR2Q1eXRwTUdNck9TWmxLbUJ4Z3lFRVRk?=
 =?utf-8?B?MzQva09QY3hra2sxYVZjS1c2MHhPa3BlTU5hdUVDeklZdVJKZm1SVlM5WDN5?=
 =?utf-8?B?Mm1QYzVpREh5b3ArMWJSUWhlQlNZV2pRS0NBa0pJTWcyMDF0bzN4MUdOVE1k?=
 =?utf-8?B?WUpzRjUrTTNhSCtJeXdPdkRseDFBYU1TOHpIRW5zazN4Z0tSa2RuRFY2R1FO?=
 =?utf-8?B?TkFVU1R6WDAySHVUc1NFVk1SblZoZ2pyaHlBRktXV2I4alJsRGVpbkRCUXY3?=
 =?utf-8?B?bTBGZ2pSZ2IvRndFZ1UzbE5KSkUxS0l4cXFLVHdEZFBXVktZVTZyb0VYNytM?=
 =?utf-8?B?ZHprN0ZBQkhoZkZXUTcxWFFZT2Y4OTRMV2VPano3VEVYdXhTSC9Dd1k3eFZ5?=
 =?utf-8?B?dW9TeG9NTFNDdUNXaEtvbTIyOUJCNTA0NzI5UndkZHpSOGd0TGFBTG5OS2JO?=
 =?utf-8?B?NGt6M0Jka2Z5OEh2Y2RWeUhIRWpuaVRac29MSHBkRXo5SkZYOXNPUURnSnVO?=
 =?utf-8?B?UUV0azNKQUpiSmZud25oRm5ZV3FoZEVBS2xRcXdYUlpIR2RzNDNYTmoyR3Ix?=
 =?utf-8?B?SU1FZUtzMWY1a1dweFZKNWFPUXlldm9xOEdWYXJzK2hsYmdrMkpScHc1QjZY?=
 =?utf-8?B?NTRUdldMbWdEd0hJTytXU1JoTmx4Q3JPeXNqVnRpNTNCL1VrWURjVmloazBx?=
 =?utf-8?B?OVEwT3NscEZhVG1MMXF3UXdxODJSZEdBTVR0TitaZW5yOWlwTEdOUXVpS2ZK?=
 =?utf-8?B?eEVmcWRMcDNCSERhaDh6TFZHZGo4UE1RSUphQWpieGhZMUllUnVxclRPZUNq?=
 =?utf-8?B?WjFxVUhYRi9jR0pzdzBWNWF4RDhNTGN1SzE4M1BtZmE0TURmZFl6Wkl1L0I0?=
 =?utf-8?B?S3BnQ1ArM3ZJbnE5bU9mQlc3d1prVlE0TG4zWkRXTGg2S3ZEdmRxWkVIM3Ni?=
 =?utf-8?B?N1c3ZDU1M0Myek51YVdMMk04OGt6VWlKZ2hyTFY3OHhiNWREcWR6NGNKQktP?=
 =?utf-8?B?Vll0Q0Uzc2dpdkRybjRTdVNaS2FOdWpDSFJrQ2IyZ1hmQnY2WmVGL2hGNndH?=
 =?utf-8?B?MjRPajJjNnhKZFdpRTc0ZHRtZGVpMEl5REp3ZWdleGQ4b3lFdzZRMVo3amFK?=
 =?utf-8?B?Z2JFMGhOOXFWWWRvcWtZV0t6Vit6bklzVWVUMk12ck5uVmptK0sxbXUwWHFv?=
 =?utf-8?B?c05HS2pkZVg2a1VmbFhBU2htVldwQjR3NnRIbEVpVWFDWDhodmo4VVBmaVN2?=
 =?utf-8?B?WkEwTGt3dUlSY3Nwb1Ztb3dxaWtGK0FXeTY0L25mOHVuejRiMWFjblJBRWFn?=
 =?utf-8?B?VGlTRjhkbjdkNk05dE5UVDVpeFpPZEtFekkvd3R2MjFmMUdZUktzdlVnSXF3?=
 =?utf-8?B?VkorazRKOU5iYktEZ0JHb0NzTGtrK2JueER5bVNxNnV1SVFVUGo4c2hOU0po?=
 =?utf-8?B?YVVhMmpNVlBvd3crVXlmV2Z3OUVaMTlPZTd1VDNOYkNwSGgwL20rb1pTR1hs?=
 =?utf-8?B?Nk5lK2ZpNGtyZWVQSlMvcEdnd2o4WVNKbWJsTmtYeEcra2h5cTRBQ0J5UDNK?=
 =?utf-8?B?djd2NFNJTy9KdmNkaTJMV2xwc1gwUGgvRTNlVUZwYjdXTEwrelpLK3NadzRj?=
 =?utf-8?B?ZVpEREpIYk40QnNDRW9yc2xDbktEem1kVHFXTXU1NDhidExtNHVCNUdmRDNa?=
 =?utf-8?B?UlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a2cd9fa2-1ef0-499e-58df-08de130dfcd8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 14:59:53.1965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sYK/w3ioRWLUUHMqaCZw036jyMDzT1vwKYp6CLTvy63yaWivh/aOznXYlMARjs4JchkwyRd15EWytrzcE1XkxpS6eaIKnoDg+7cBif3byTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11806
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 15:00:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7822

Hi Pierre-loup,

On 10/24/25 10:44 AM, Pierre-loup GOSSE via lists.yoctoproject.org wrote:
> From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
> 
> Added by commit 3892912bd7e0 ("wic: extra partition plugin") in OE-Core.
> 
> Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
> ---
>   documentation/migration-guides/release-notes-5.3.rst | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/documentation/migration-guides/release-notes-5.3.rst b/documentation/migration-guides/release-notes-5.3.rst
> index 417087e35..335302edb 100644
> --- a/documentation/migration-guides/release-notes-5.3.rst
> +++ b/documentation/migration-guides/release-notes-5.3.rst
> @@ -390,6 +390,9 @@ New Features / Enhancements in |yocto-ver|
>      - Add the Wic-specific option ``--extra-partiton-space`` to add extra empty
>        space after the space filled by the filesystem in the partition.
>   
> +   - Add the Wic plugin ``extra_partition`` to install files from the
> +     :term:`DEPLOY_DIR_IMAGE` directory into an extra non-rootfs partition.
> +

Thanks, that is an important piece of information.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

We should probably think about properly documenting the different 
possible plugins that one can use with wic and how to use and configure 
them.

Thanks!
Quentin

