Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A1AE9B267
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 13:56:50 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.2])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20605.1771941404595537157
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 05:56:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=A+ZT7MMz;
 spf=pass (domain: cherry.de, ip: 52.101.72.2, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nSR1I05J+ZqEB2piQ83F2mjj8rX4xDRP8Eb+K36KsTe1X7cBLILov5hf1UWFBYuoipUYwDZ0xVum+rB0LJ5tYQHG4HWPARhVIQ75/X/AkZxhXv9Zo7dzLSMkh7XA/o3uV5PZrKIr527W5Ie0KDz/9jbfFMWDRwwwPHZXHG/rQX61LBz3XvS02RjfN1ckeUyhP3cNM6W3UL/QRZ5gRzguU1+bkbA2LZz33vaWnEH0FtPPba+QZJR5fwBiAFdp/r9/o9hAu8zRYwMtVl5WIpw0mpvzCso7KEAmDp2vGj/Y5IbNJrwW1S9DdkSulWgKS75UxlQS8zGbDZe/N4Id9ujh0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkzdvEb+F480YYFAdAgE6MVA7T3b/kaueVCTBYQ2oGE=;
 b=s7IxxaMZg4NeT7LtYXPWdn5bsSDmZTp6XUBb1AKb151OV44x0i0iwHbSNkEDW8iKkb6iNrP7g9W5avAqDQaFDNBNPJdRkeg2QuElLPcztBTcLrNcK9ScN1YtE81pc0PGVa5EuszhUstPwVNK5OuKAr1z/RkLoVeOT6PX5Pvihd+gWRyuCfuE5aF7j08+UjslzZONoE04s9sPgQYS1dFlDhEnw5BM3i+rrdpyp5ful8rLJNc1V/pKMN5RQA7suq7oBZ/YItj0xVWlAfvBp57wtRrS1pqYjjXDcb6SJDDMUBYrfio/k3f0x9bpVsXhfdnbVmfWMX0ekFpO4xOzs0Ssmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkzdvEb+F480YYFAdAgE6MVA7T3b/kaueVCTBYQ2oGE=;
 b=A+ZT7MMz5PNNw4wfiFwi+OEyl9VfRuDPsZE6I/5TWljUzrC29izKGbN+wqVlETocOYM9ltrpQVuK0hSRmD4vqlbqyj1K5XdqmwLd2IcOapiGpTiMh9n73Bm2Fk+emEVNIMlyqNsTAjDGKF7qanAjRucOsW+xZc3gpDjEiBbeYRU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA6PR04MB11912.eurprd04.prod.outlook.com (2603:10a6:102:51a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 13:56:39 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 13:56:38 +0000
Message-ID: <72be7e47-abc9-4c4b-8e4d-6604bf154f31@cherry.de>
Date: Tue, 24 Feb 2026 14:55:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v4 1/3] use a venv for installing packages with pip
To: Antonin Godard <antonin.godard@bootlin.com>, foss@0leil.net,
 docs@lists.yoctoproject.org
References: <20260216-fix-make-multi-target-v4-0-749e588cb7f5@cherry.de>
 <20260216-fix-make-multi-target-v4-1-749e588cb7f5@cherry.de>
 <DGHXUDE510VH.1JG9S6P90SNTG@bootlin.com>
 <e41bdc41-be0f-4c85-bcbd-e00b10433336@cherry.de>
 <DGN1TVXRNHW7.2TYSX3YXZYQB5@bootlin.com>
 <808a63f9-77c1-4d61-8856-87277af3b894@cherry.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <808a63f9-77c1-4d61-8856-87277af3b894@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0236.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::10) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA6PR04MB11912:EE_
X-MS-Office365-Filtering-Correlation-Id: aad3dd9a-70a0-4970-1ec2-08de73ac87fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SFBsN1hVUkhYdFZLSmxKdVhveFFEWFpEZmQ1WTI4bFRVd3VLUmhzYzYrL3FK?=
 =?utf-8?B?WlNLSnZibUVSbmpCb3VjNnBBRFNzYjMrYnB1NTdTSkpIMmVEMWtsUVdqeGgz?=
 =?utf-8?B?V1VoTjkxSld0eGtFTXkzdWhvY2V5cVdUdGExM0p0UzRKN3NTbDNlRFVQRDhn?=
 =?utf-8?B?SzRBWG5tVENvQnNad0I0eUJmaE9zNm1pWmxPaVdKYXorR2dRb0N0bW9ibm1p?=
 =?utf-8?B?Y21yRDFvQXVIWVdvUzBZc05hdEczcFVpNGxncStFaE11THRGeTlxYkEzYWZp?=
 =?utf-8?B?UEYzeTdSWm40bExJSGd3MWVuQnhWcjRGeXJvVnZLQVBudWYwR293cjdZMzZB?=
 =?utf-8?B?MEFnRCsydXRkbDludmltSFl3ZU5QRDR3MGNSa1F5SjYyQ0dlbXFkVUJ3TGg3?=
 =?utf-8?B?dVJ4NFRHMDRmZWhvSnZhUFJ3K2t2UWsxd3VzV0RBQVNkQ1hEbGNscG96aWo1?=
 =?utf-8?B?UG1NT04xbThyanludjNKUStnU2RtVDNKOGNTN0w4NERXOWVNSkpJUVBDZ3JI?=
 =?utf-8?B?TDd3RWVWK3RJdlh5YzlhYnl5R0pwN3RIZ1pNQVJLbVVxNThaamtpNllRVEtE?=
 =?utf-8?B?ajBNYUg3cTlTZ0lDWGFaWlB5d3JZOTRhd1p1TEdpS201WUNmUzc4OGd6QndJ?=
 =?utf-8?B?aTVva0FOdCtNcWxJMHQ0QzlaNmNTTUJGSDJGbkZzcHlJOEEzMTRhME41K0lr?=
 =?utf-8?B?c2o0dWc2NHhJS3ltd2liQkwvaEIwb1RabUVYTUN1TEFWTVpaSzJPU01wWGly?=
 =?utf-8?B?ZG1iSDBmNThaZjJQNWhkUi9ZME9NbEZxTW5HZlppNlZ4WFM1enRtcnUxdWxa?=
 =?utf-8?B?eXpEbEc2aWZSZmhUMTVlY0c2VWRRa1FyZkM4Tk5oK2J4ais1elM4czdZK3cw?=
 =?utf-8?B?YVJNWGt4UlVKTC81eUZrNmFZS251aWYxK2JPOUp1TTI3QVdKVVpWOGlXZzdV?=
 =?utf-8?B?VjhMYjlhMUl4WTBTM2FmZUJRcklpbnV5MWk0eWR4aDBpZjRLdDN3WFRFTkFQ?=
 =?utf-8?B?SHN4eHJmcjVWclFMdlozTUkyUW9lRmRBdWlOeFExaENsVkpLM2lrS0t0bUtR?=
 =?utf-8?B?MXlUT2pMVjNFeGVaUk85V1kwdUphNVdRVzdBMHJWaDJ5bkc2aHJRSys1NWFK?=
 =?utf-8?B?dW1sVFVMQnNvdmFlSDV2Rm1yWSt2RVpia2hFL0hmc0c1Z1dTS24zWHNtMGhr?=
 =?utf-8?B?L3hBZTJBeEVoVXUwL2t0TmFlMjhoK3FpKy9wdzRsSTVERVI3WEd0SUcwNHJK?=
 =?utf-8?B?TVZGZjZGQktqcHdlckFOU2xpeHZzRkdmemJoNmtNcUh0RjR1aXBVbmUzd2s4?=
 =?utf-8?B?ajYzSnZaUnkxdDBEb1J1Ukp6SzVMMHpQUFpCcEU2M3JnNmM3OG4zNnlnVUhx?=
 =?utf-8?B?RmZXbkxMSlFmUi9ZUjNucmZkMW9ia00vR3pLZ0tlNHlsQXdNQkdPa1ZRcytS?=
 =?utf-8?B?S0NLdHB0NU1uNGpoeUM5QzZET0YvbytCUjdPc3NGTzY5ZEx2bjh4WEhkVzFn?=
 =?utf-8?B?RjIrTGpKTlZ3NzRJcU5rUEUrY2liaG9GZ1J6RStDWmZBa1B4MXd3THhjeCs3?=
 =?utf-8?B?Q3kvWnFhQVN1Y0libkkzNmxLZEZVSUNJcXJHN1ltbzRlOXFGUCtOKzhCaTVR?=
 =?utf-8?B?cDFsV3gwLytjSk51WXU5K0hiZnVnZlBiZzFLZHZJSGdvWGhIelVmTXErQmt3?=
 =?utf-8?B?aTJ2ZDNSN2JhMzJnNjlPa1FGdjg0VVE4WHVjL2dvK3dMS3EwZ1VBUUhGaHFo?=
 =?utf-8?B?ZUtoSUlOYVBJVTJaNnBXaDR6V2FycDJxWk9hYk5OcitjQXMyOVFQc3N0ZXBz?=
 =?utf-8?B?MVJoNkY2TzQ4Ri8zU2U3Q2Rhd1phY2FjRVlDVDVGRW9GL3hLZGF6ejdoRUdE?=
 =?utf-8?B?ZzVQaGdPMjYvYXErVE4xc1BxOG1VRmVMdGVpd3MwaVQxNWJzbmN4UzFqZE9F?=
 =?utf-8?B?TUt0aTBtR25KcTdLWWJ6dFJnQjNSeGRZQ3J5NlNKNTY2enAvTnI1NG80Ukwy?=
 =?utf-8?B?NGt0S1VIVEw2M2hoU0MzRlRNYjVwaWtHUm9NeFEvMEdSV1BWcmVhZ3RxTTFT?=
 =?utf-8?B?NnNOZTZHUDU1OEhHMUlCakFvOXMxV0EvRUE4ald0L3BhVGNXWUxLREFJUThI?=
 =?utf-8?Q?a0zY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dzNjclRIR1pHbHpyK3dNT2ROcWwxYWlPVFZTSW1maDFsRWNVYVJSVHZ2Mkh5?=
 =?utf-8?B?YU5lUEJIVllNazZKUnViSThmSUwvQ2NjeFdxN2ZEd1E1eWVyQ3ZINEp1YTFE?=
 =?utf-8?B?eFA4RkFXcFk3MFYzbUl0aytaZHl4OXFCSDVBdC9SbFFOaTRQc1hudm13NEJp?=
 =?utf-8?B?cnJITEFEaENjaFc4NWV1ajNFT2ZvVnRCSnlOQXBSRnRDb0dKbDkxdStJNWlG?=
 =?utf-8?B?czBYSXlTUjlNcE0zbkNOSFA1RVRZci92dS94NXVnY1Z6eEdJZ0RzbUJJWml2?=
 =?utf-8?B?ZjhQSENTNmNnVjdkRklPc3dwSzU0MGkza3JFQkx5WGppZmpwSXdudDFrenE3?=
 =?utf-8?B?bks4S1p3bU1sY1ZBNEpsaFdya3RiNFBxMUpqTStZNWdiYWFORFJWSnF3Wkh5?=
 =?utf-8?B?NnNMMGVhN2JhU21rbkc3d3ZXOC92WjVxeUUvLzNoVmoyZmZJd2FpZDhGN1ps?=
 =?utf-8?B?NXo2Szk5VEl4L0orb0ltY2hnRlBHR0dvSUpEbFpibDlhY0pIa2F3aVVrMzQ2?=
 =?utf-8?B?VE9CV3ZmUytuRktwTWtTaEd6UmdWWjNJK0Zyc2xuU0pLWnlJc3FiSHZxVWQ3?=
 =?utf-8?B?WExnc2QzZVdvUmdrUTlHbFBZU2JTRXFTQVJ1ME0zR2wxQUkyVy9QbjBEQWJz?=
 =?utf-8?B?MDJablRoclJqMStOZ3lKVEhjaEVsK3ZiaXYxU04zNHlrdmF3NTlIby9GZUZj?=
 =?utf-8?B?cVBVNHJyUUx0aElUSUN3dUtVdzZOeXV5UCtjc3FGWVBmQ1ZJWWYvK0tibzYr?=
 =?utf-8?B?WTF1RmdNRm5PUmtOUkdWQUFKNVFXeXlRZDZQUjBMc1NYMURGb1hXSDJXUlRj?=
 =?utf-8?B?SDJpS08wTFBPSkR4UDM5VjdJUG45L3NZdC9YTFpVMmFlVncwSEp6bmFhV2VT?=
 =?utf-8?B?bUxod3dMV3ZuM25aU0doZFNEK3pMejNZQzRuVjJVM0I2Ylp4MmVEZmJlczJw?=
 =?utf-8?B?S1dlMVI5ZEgrQUxrWkxPdVpMVERpUXZLRmh2dDBLam5WZWo2TkVYRE9jNkNo?=
 =?utf-8?B?SWVVUjVzcG5jV3B1RmRQaXRuWGZiTnMwdXhzbjFZSG43dGJPYk1TOHpYeGcr?=
 =?utf-8?B?VzR5cWUrQkNSdmx3T283cU5YRC9kOTQzTmVkQUtmVStXSFNNTGVyMUJBcVBn?=
 =?utf-8?B?UC9heURORkd3RmNwd1lSVnp5a00zL1dCOHFzQ0FxOE02QXJSbGY2LzZac2Ns?=
 =?utf-8?B?aXpVVjEwOGRyZWdGRkJ5NmlMU0Q2NVNrQVpadzlpelRTZHFpdzhWR3UyUFhn?=
 =?utf-8?B?dlZhNmYrOS9NV2dxUjhQWitHRWZNeDJCZ3lHNDJQZ0wvNE5Tb2FKbFAzWHZo?=
 =?utf-8?B?OG1nNFBkMW8walZBSTMrZVdLSHRJM0g5VzByTVlTZmhyaE9xSHFYU2dvNWhF?=
 =?utf-8?B?VGRkQkd5QXovTldKakVFSEVIcU5XWUhXdHJlSVdTc3NWOWF0VkFqaE0ycW9C?=
 =?utf-8?B?WlQzYmR3cFBwOWhJVmZkR2NDNWdJNWdZL29ORDBGWHlINFpVbnlmK0ZLKzRi?=
 =?utf-8?B?MXVrTEZzSmxKSnA3Rm5EUURYKy9tSWlyOWgvRFJoeTFSZHhidFJhWjAvZ3VL?=
 =?utf-8?B?TnAyYnVUazBHblRJQjR6ODJTbVpIc0xaZ2lPNzRBUC80QmRTZmRWNmpwejM0?=
 =?utf-8?B?VmYxTHFzY3VvQW5uNjZsYW5HME9mRHQyNnhwUU5BREwzVXR3MjlybXlxZDQv?=
 =?utf-8?B?ei9POWFyalpnNG5pRjRmM2pQSXFkYlpjQzhmVkxmUEtETmRyenc5Sno2OTU5?=
 =?utf-8?B?Ylp0ZFpNK3NXc2xvd3JlUkpPOVJDSHVmWXZVb0dXS1BpQ0dWZEtsYWJvS2I1?=
 =?utf-8?B?V1F0eWtGOUdZbWJKd0JuTHE4NTcrcHR4cGc4MUYxbUdTQ1A4RE5kemN4ZE9H?=
 =?utf-8?B?THd6TThMVzN2Y0h5aTQ3RzNkT1NZVXc2THpwdWFMVitZbm9jV1RGejNzdnJk?=
 =?utf-8?B?UXFzMnIwdUpzVDNnWmFBamFQdlNLd2hETmR1VkpSM1RCY0xtVlJnMjA2TXY5?=
 =?utf-8?B?RTNWVExZMkp5bmcwak1SRHVYajZQcVBEMEZKK0NjSHdPb21qM0RtT0JzZVVL?=
 =?utf-8?B?UmN6SjhjcWI4SUg3RzhEL1hyOTZyaUN5ek56a0V3eDV3ZFhzUFhOQzFXTnBV?=
 =?utf-8?B?ZCt5dlBsY1ZzNkNIemhHQmh3SDN3N1RUMTFtNmxQR3huZlZOcHRjR1E3MnMv?=
 =?utf-8?B?Y2lPaWpRWFJhSGhmQ3FUbTdjWjhsUGhxNjdrczNYV0RYQkdRVzlHQlplWFdZ?=
 =?utf-8?B?K3dTYzN3TlF1NzdvMTA2czl0VUxtczM1eHJLczVCMEk5QTFJYXpLbG9mS1Q1?=
 =?utf-8?B?akNER2NaZFB4ajdkREh1TkhpQWVOOVBjZVNLODREQjJHRFBEWHJRanBCYit5?=
 =?utf-8?Q?ztHn7+k3oeOIDjzaAEHrxKl9M38PUtYK9XJWJ?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: aad3dd9a-70a0-4970-1ec2-08de73ac87fe
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 13:56:38.7625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bF3+IUKWCXI/VY5NAPiQfIIoKcWr8cJ6jr23XvFr1qqLv/mnzqi+UagXJKdI0m/MeC9JvImvHdTk1fE8Ku9bQ7pdJI/1nySQEYfXQWXHCKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11912
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Feb 2026 13:56:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8970

Hi Antonin,

On 2/24/26 1:52 PM, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Antonin,
> 
> On 2/24/26 9:28 AM, Antonin Godard wrote:
>> Hi,
>>
>> On Mon Feb 23, 2026 at 6:33 PM CET, Quentin Schulz wrote:
>>> Hi Antonin,
>>>
>>> On 2/18/26 9:18 AM, Antonin Godard wrote:
>>>> Hi,
>>>>
>>>> On Mon Feb 16, 2026 at 12:26 PM CET, Quentin Schulz via 
>>>> lists.yoctoproject.org wrote:

[...]

> So... I'll be working on fixing sphinxcontrib-svg2pdfconverter and 
> hopefully we don't have to wait too long for a v2.0.1 (or whatever the 
> next version will be). This means we'll be able to use --system-site- 
> packages again, which I think is neat.
> 

See 
https://github.com/missinglinkelectronics/sphinxcontrib-svg2pdfconverter/pull/34

Do we want to wait for this to be merged before having a look at this 
series again? This prevents us from using --system-site-packages, but we 
could decide to not have it and force all Python packages for building 
the docs to be taken only from the venv (which is what happens when 
--system-site-packages is *NOT* passed to venv at creation time).

What do you think?

Cheers,
Quentin

