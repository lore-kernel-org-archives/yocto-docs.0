Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC86C5AD49
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 08:04:30 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.65])
 by mx.groups.io with SMTP id smtpd.web10.24385.1748246668865562291
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 01:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=b87qY9Wh;
 spf=pass (domain: cherry.de, ip: 40.107.103.65, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHKjzTMrH+VPiIyYcpZNweT9cWt0AeQ1Vo7CQh6TzaONWlinWcm14x+pRCK9eUeUgUw36NpwnyztSSKvQWlieQ4Cj7GMY+0oKm+TNxHBgsHK858CSV2rp+dUw9pIh/LVLMXfdH/hg4g0jxkVlH5brbubFxfrq6QVsqkY6xzKYv5GyVpFvYcEUDIg84jrn8KyPLRuopw6dnDRqQlKpQ/SMaIQhL82EVv4yL9UpB5LTmFdmu4kF4Uss33PPPlcqia3cNzNCwAQJpOeNdGqOLGP03oJtEhqTOHBAJwtoGkq9X6/GQfNqCBrh8ASNXL+nMPrq2jU+kGwqS4H8xl6PFGIgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4GRnaSwf9dgn9ZlS5lUdoVpLTPdfWXOOvwS31juU9Q=;
 b=J9ht5OqCRY34tx8Wn4XM7p94x4GbEzQsfFibb4G6Q91wZMvI9Hp5X0jOvLSLDQnrRt0WeXqDpLT+a1iqhuxzKgB3rQK6woHAQPseKLbdfEhaCioQWqzFzs3SUNJXSm9ooF2Ua66rabsGD5uWQgWI1AoTDD+nHuIloBgWnpsNifsQ4NCBEThcclvFZsaFPpd3MevF7nFyKX+NMJtsoW94L5ocWEEdt78nk/3LK5bCBWrWg5R9JhXMm55ADBy54cgEwOZxJaXunkp9UWIAKAEWYpafJRF+Bai9SdKaUKH0SADq7nAx9LY/+GLBJf5QWBImtIBuWhjKSO04Le35aR3j0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4GRnaSwf9dgn9ZlS5lUdoVpLTPdfWXOOvwS31juU9Q=;
 b=b87qY9Wh6YRo/4Kcb8Zhwe63VBPwcYh09kxkxDk6ACvU9P4N0Fxwy1Ge17Bg9S9L6EEZP+S40X4l+C0bT9zN7VWawpu/ZVByOAa4J2yqYKzlBCOc4kOt7AG3InAt0o7GtvpNF4bHto+4TNs3V5HnYo62lFljD94XLyiMCVeRhLM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB9123.eurprd04.prod.outlook.com (2603:10a6:102:22e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 08:04:25 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8746.030; Mon, 26 May 2025
 08:04:24 +0000
Message-ID: <5e830302-b275-4f5e-836f-6e3566fc6d97@cherry.de>
Date: Mon, 26 May 2025 10:04:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/2] sphinx-lint: superfluous backtick in front of
 role
To: twoerner@gmail.com, docs@lists.yoctoproject.org
References: <20250524014902.35467-1-twoerner@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250524014902.35467-1-twoerner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0017.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB9123:EE_
X-MS-Office365-Filtering-Correlation-Id: 300ffd9f-6b04-496d-84a9-08dd9c2bedfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QW95Q0FraHAzK05IN3B6U21lVzFsQ0ZGeDRMUDU2aFpWL1AzSXRwb0hHTjZP?=
 =?utf-8?B?T29QUU54MHA0Ym5rTjBTQW9Lb2E5NVFER3lGUUlzZFNFWEdWV3hmajkyL3N1?=
 =?utf-8?B?dnJ3Q1pGQWdWWXFCU3U0VEw3c1p5c3cyMllKMkdQY3ZVYWRlVUV6NTFZQTYr?=
 =?utf-8?B?V2ZhcGRFK2JCelY0M2NoUUN1Yml0TXR6eG4xUlE0Q1MvT0RjUk5ETGtwWU5E?=
 =?utf-8?B?a2ZrWXBHQkVOOS90Zm5kYnVqNnVkR0laY1luUitiNGhYRE1xcE5mamhIRXZI?=
 =?utf-8?B?Y2ZOR3FWWDY1KytSR0wzNVY5eldJV0ExSkZCZExnOGF1N3gzcXBIWmgzTTVQ?=
 =?utf-8?B?MFprcStrUVZObEt5TjNlSXBQK3o4VDhxYzk2a2NjcFNGYVRPRGx3QXltdTJz?=
 =?utf-8?B?ZnFuMXhFaENOK0JNSFVyYnVDZ2o4dG1HckxKREVxSFk0QzY3WkgwQS93KzhQ?=
 =?utf-8?B?M25ZVGxHZzFDMVNnUWU2UjRKblhHMzF5SlZFam5FR09zNjh0OFNZYWlMc0Vn?=
 =?utf-8?B?UExpYzJ0b3hNTHhQU0Q2SWVrOHJCQi9PSHd1SkN1MFVNcGNIS0J4ak1iMzQr?=
 =?utf-8?B?MFV3MS8rTC9DN1lueWxJaUIxVXZpQ3ROVWpZV0xqdjFZdEtuNStiTm5RVTh1?=
 =?utf-8?B?V3BlKzFKY3BCcXlNanQ3ZE1MQ1ZWUGNBUXA2NkNsSnlqUjZKb2IvS2R0OU9s?=
 =?utf-8?B?djh6Y3BFQmEyMnJsVGNaSzBrVVJvYUtEZ0QyL0lNRHp6dnhrcHlxaTB3Zm1W?=
 =?utf-8?B?QllvTm5oSG54a3oyZFpjak1lYmJwR2QyNklKMytuaENyeUhuelkxckxMQlBp?=
 =?utf-8?B?MkpsNUJLTkRCY1NPT3VaT3ZKS1F6Q3pVSzdNU2ZrcGpEVkhsN1F4T0g1T0sr?=
 =?utf-8?B?L0RLY3I2Q3ZtYy92QTJ4MkNMLzltdnlHTXQyQ1FteXBIVFZyVW5ZZXNabWsw?=
 =?utf-8?B?ZEM2dVRsUjZUTzNneDhLeHAycmhENHFNUnh0RE5ESGdOMWVnaXYydGxRY1Q0?=
 =?utf-8?B?SjNQLzBDNCtSYmpVRVlhUVhqaVlCZzlZS3Y4WFd5bmVNL3diSDF1d1RodzQ3?=
 =?utf-8?B?Q3VhTEhEWWtRSGZtaHQwVElJSWtjdGpOOE1rUUxvVjRZeVI1bmpaSitTSXE0?=
 =?utf-8?B?QjZwUTljWW1xMnRWL3RSMUVYTG5GUHFQVGRLaytjby8waWMzOEZLa25xdlBQ?=
 =?utf-8?B?VDhKeTE3WnNiUTA5Y2Y3VWJwRnI0ODZ2QTM3VEVGTDFEVkRZWlJIS2p0OE9L?=
 =?utf-8?B?a0w2NldUTVV3QmFxR1VLN0NWaThPMFAvcXFyRFU5SUVUZTdBY0Z5eTVIblBO?=
 =?utf-8?B?Qjd1S2wxY0tZMHQ0eENKUWhHb0VDSjVybGxzTCtMZk5nTHM3YkJ0NDRBMkEx?=
 =?utf-8?B?VjVZL0czeDJQTWxkZksyeThFbFFWVnM2MVJucGxtY3FkZnJscWR5Z1UxUVIy?=
 =?utf-8?B?emM2RmQ5S3pTdXEyRU5WV1lVS2VJMU80VVZmTTB4VU1yenhhMXV5ak9sYnJ3?=
 =?utf-8?B?S0VxTXZJQzBCeVlpcTJJSExOZWwzYU81SWd6ZjZKeG1XbS8yOCt2MCtySTFh?=
 =?utf-8?B?OXdqTTRpcnFrUys1dGFXUmFTYnVSQUFsNk5ZN1E2WGtoSnJJMEVUMjlGNnlo?=
 =?utf-8?B?UGxwR2hWamR3NEttZHpqa0ZyR1EzdWxvSmhZSVhQaDFnanRuTlNFNHg4NlJi?=
 =?utf-8?B?UEQ4Mm0vdjhFQzFqaVhYOUd0c1A4ODNxT0NtVmY1aDNBbGdwczJYRXd4VVJP?=
 =?utf-8?B?SVI3VWFFWlE1aFltZWdhbVJUaW1KdGNUSXZ4NXovc3BqeFdsTE1xS0NDMXpN?=
 =?utf-8?B?MmV1Rm1sYi9WMXp1RGVzRHdDY1hYRkxVekJwcFBGcjRsQUVOeDYzODhVcmNa?=
 =?utf-8?B?b1VFRUJtY1Rtd25QV1dNNGxMa1c5VXVYd0Q4ZzRZUzBaTVRXYzdmS2pOQnNx?=
 =?utf-8?Q?M9a9RMZnxsk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UUFtaVp0TXlHRDkyMGZTVCs3bVBIUG91VzBWeGZwVVpYM0V3N3FVNEpXdUlN?=
 =?utf-8?B?UlRoT1JZelRnSHBsTndRRkNGZ2l3S3cySlJXVHAzajZueGpDV0RmKzk5dzF3?=
 =?utf-8?B?Vmt4NjBZZUF2YStpdTg1WlhBR0MwRU9IeXkvUU1La3dveUdoelgzeE96MGdG?=
 =?utf-8?B?bWh3VktlZzlTWE1jWFhjbzRDYTh5NDM4TGRyL0ZZQkZoMzRSay9Xbms4SkE0?=
 =?utf-8?B?YktIRStaaEhEV0JkdTRvNTBJcWdHeUZYTDhaNXM1elhKbW9DR2FCZTBMWDR4?=
 =?utf-8?B?cVc1blB6RC9saHJqbVArWGJvem45RTN6U2NNOXZSRzlRVEVRQ1JKT0VFRmJq?=
 =?utf-8?B?NFprVXUyUDV4dmtuYXRvZ3RVVms0R2hyNWw5c0RKUU01eGlWa2p4WGpaam1X?=
 =?utf-8?B?S1lHZ1dpTzR5WjROcWxIWFM4STN5MWg1WDJVNTBTeTFZQXR1Y0Z4YS9NbzBh?=
 =?utf-8?B?N3I0SXY1ZkYrYVYxeDFuU21qUk1tRVZ6YkJzV21jOWNvRm80L09YVmErcmFi?=
 =?utf-8?B?QmJHaW5PVEFyVFBDVmNIOWZwKytUZmtsOUI3MWZpQ2VLWjlsWXZGYmI5TkF3?=
 =?utf-8?B?blpPd0crYUhvbk5qNC9iQmtUTTRPSXFheEhhNFZhbjFJblRmWjNEWHJiSzQ4?=
 =?utf-8?B?d1lKb213RzFLSnFwVmdNNWFiV3dZYzBXS1dnTVU5UWJnalVDbHZxanA0Kys4?=
 =?utf-8?B?ZHV3N2hiNklZU0xUZUt2dDZ4aVNMUG13dFZILzNiUWpxRm01aC9FbXptYWRN?=
 =?utf-8?B?aUY5WU56WWhEOVFoQ2xUTWp3Ukg4aGRuUk1EamJHVjVIZCtKTUF2Vk03UGVY?=
 =?utf-8?B?dFNqbDY5RWRTdmR1WXVoRTMxcGQ0WUVRZFJFb2E3NzhBeTNSWGRncmpmcHgv?=
 =?utf-8?B?U2t1a0NXTjFmVnNrUWhTa2FJL211cWdxajh6V3VmT3Q0azNPK01sTHZ3MGho?=
 =?utf-8?B?c1JhTDFleUxFQkhTZTNCK2ZoN05BNkV4UWVNa2ZUbHd5UytIdUUwdkxCbHd6?=
 =?utf-8?B?Qm4xOUQ1MndzOWVzcURUNUVLejdVTExhUzU4bDhXRSsxZmQvbi9NMnMyOUlp?=
 =?utf-8?B?czVqZU04dXQ1UytJNFpMTXhFbm1XdDh4MUdWeFZqeXZ6c0R4MnZ2ejR5NXdD?=
 =?utf-8?B?Vjk5NzdkNStqZXBPTENnMDFYUHA5b3ZXOFhrdWtVc0E4S2gzS1ZzZkxHTllF?=
 =?utf-8?B?Zk4xaXdaRkpwcE5MWFUrRlBwUVllMmVkTW1QWFdoNEUrM1ZFeHEwMHJCUFdi?=
 =?utf-8?B?bU5HanlwMkVIU3NEWVQ2MHhhdm92Z3JicHhlMElkdWs3RW0xWDhscVFlbjBG?=
 =?utf-8?B?eUhNaTZGeC8vYWFRYjJLY09kclRMQ2xYWnVFVGhDajNibzBHbExrRk8xTzI5?=
 =?utf-8?B?QTkyZnZkZWh2eU9sS2pnOWxlcTkrWEZBejg1RGV5amdsWkVVZ0taOFNDVGhq?=
 =?utf-8?B?UnArUjRPTk5qTVVWMkRCUTRJaWtTZHV1QkxwU08zNWpoTy8vZWpQVk9FSlBM?=
 =?utf-8?B?MGJRWmwycG5LZTZXVnh1RmdVZUQ0Q3pqaVRTZDhzSmc2cjBVUTNqUkZOV2JN?=
 =?utf-8?B?elZvaFZQYkZPQ1FXL0EvM3NRMkZRZ1FsUTBkaDB3aGhYc3JIZSsvU0NYWkJx?=
 =?utf-8?B?VWFHSGM5cjVHQitjaEJ3bERERVg4M3FZOER6L1NqK1VIcVhIcFVyUmJDaDBp?=
 =?utf-8?B?NmtXc2NtUmZVVWZ6M3FrSlpnQmV1MmhGZDFWVzFxL2ZOd3pEK2V6NDVCMkFI?=
 =?utf-8?B?c0grUElnYVp1NktqRm56MGhTU0ZiNUJhUnh5Y2NLQUFxMzdzbVF2djdPVFJn?=
 =?utf-8?B?ZWllemdtUHgvWWpGRDRncU9NTDArUVMwOEJTTCtEN2s3ZWVPb2tZY1JzbWVi?=
 =?utf-8?B?RVNVYm0vTzRmLzhTTVhxdTdzU1BzWFk1MTMrSHRJKzhHd2FOaXZibE1MM3lp?=
 =?utf-8?B?SHRqbGxybVVoem1QZVVUUXpNU1hZQTNQL01XelY4SkNVZGpTNTdiL3dpaGVD?=
 =?utf-8?B?L1BhVUxlMVpuRWNtZEFqelArSFZZNXRtZ1d2UXBZNUVSL0ZpNmxLVU1nMVFa?=
 =?utf-8?B?N29UUUdySjFUT2svbW1IZzVPTzNtandhQVhOVWUwRGNTdXY4ZFdNUnRIN093?=
 =?utf-8?B?Yy9PYm5EaTViWHliVVBMNEJGaHlRNUQ1dGdDMm1sZFJmbWluLzRZc1ZXTllx?=
 =?utf-8?B?R3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 300ffd9f-6b04-496d-84a9-08dd9c2bedfb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 08:04:24.8531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pxHY96kqm9N3/x73uRigNwiT4OXIAVyeZxlfmWbPbZ+6tqeWMk2tWJ9KQ1pA0d4VmsvdUq826xQkvXaPOaSWXD/1QwC3Z/8t5Q2G6Gtzvlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9123
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 May 2025 08:04:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6918

Hi Trevor,

On 5/24/25 3:49 AM, Trevor Woerner via lists.yoctoproject.org wrote:
> Fix all instances of backtick-before-role as reported by 'make sphinx-lint'.
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

