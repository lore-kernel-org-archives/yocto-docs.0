Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B50D34089
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 15:40:10 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14370.1769528404079078286
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 07:40:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=B6K2Nf/Y;
 spf=pass (domain: cherry.de, ip: 52.101.72.38, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHNKAH7tP8KmLHgokq8+6WYRgS8Viesayg8dloGwVG7nphBkSHulnAmtxCNNpyl40yrUW/RBs9Bom4S/xSNHn5OlCSusF55/rUw+q9XkpjRjngDIeU+yiTl4Mu1h+t/+ENmKNSU/oIXIp+lgJzcQScv3TJI2c9upapD3XgFKZUhsvllx/ZFsjVcHycTLPaeqKdnm6Ont3VlDw8HUmnPHJtLNlQIuyU2Wvw9RXalor/96ZDLYUOfZli1kFI3qO0BFnNraePSjD2C7rEYTYW3Z0cxx8S1E5VOrjkh1VIcc9QXQwMK5xKHLIHxPGH+o+qBSjOv+7JTFG/Qw+yOmwOuXKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxjPefFsiawfGVxbuE7pvRQ/0u9MBzcqKgdNbZ4KfcA=;
 b=QMj+zCsP+aU8Sihurd5SxS2Ni00OlPkjCjonf0j5HjkyEjNwZSpcoeZWkOYmMOw8kEBozuiIjJqyVQ7QRYfM3gxQ2AOmuaP+1/vskAkUZhimv+P20v2VYGL64ooPHzpXsQAYLWj3vpjf9eyrOK6mxLzUiyRN31UKjGEAIvMSCTJHeyxo1kj3FwFlZNiBwZ695BFXZHCJOtHeoJTW1nrSa40urP/POUOXEzO50/JCkCrbOKixh+4j5C+Oyu6GgJUUmLgyOmZQI+fEDxG6LvbxE3xB5ulXrC9t54+10Vd71RTjytykNTlC8wM9KDNkLbl1b5i8YJZ2Ewdowos9GWf5Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxjPefFsiawfGVxbuE7pvRQ/0u9MBzcqKgdNbZ4KfcA=;
 b=B6K2Nf/Y32xI6a7WHkIc9xKy8NmUolc9puzIQn217wTNlOlLWciGj8WtCTyrGAezl7AY2Kwv5aYUY39bMbG48jkJFIvSHUsN0JN1MBl7cE4Jf31EobtKdbCvw1nP/UIuQBZUQuZKYQIY1HJqb0phD1BOt04N7LL9K6kLdv/fjls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DU2PR04MB9145.eurprd04.prod.outlook.com (2603:10a6:10:2f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Tue, 27 Jan
 2026 15:39:56 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 15:39:56 +0000
Message-ID: <5d00c185-3692-45e0-841c-e4b4a6cb29f9@cherry.de>
Date: Tue, 27 Jan 2026 16:39:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 14/56] dev-manual/new-recipe.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-14-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-14-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0237.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::12) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DU2PR04MB9145:EE_
X-MS-Office365-Filtering-Correlation-Id: 4154bacf-a1f9-45b2-e05c-08de5dba5253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NUtoSGNyTExpTDEzTFBGTjNKSnlHbzE4dW5vTlU1ZWVHRmtQWklPWnVGcTZq?=
 =?utf-8?B?V0g2eS9RNTVDOTcwWm1MYms1alIzRjRJbVpLUkVjVWlGR3h4MVl1dmt3RjVJ?=
 =?utf-8?B?YjUxc3hQOWRUbThPRzduL0djdVptY2V1dDR4SXVzK1hMMTJ2TzQ1am1RYzFk?=
 =?utf-8?B?Yk9HMVNOVVRkT0dwWXJvSHhsQUNvYVhsbWtFWE5Ta1hMbzErZGFoQ0dhdlVG?=
 =?utf-8?B?UTFUVGlGdTUxemFhSzYvbm9nSDZyOEVRMXhFc29wT2hZbzRvbXFyQ0ZTa1dt?=
 =?utf-8?B?SkZBNS8zSDZWZWZOb3Q5blN5Mzc5OWxrY0NxeFZlcEw2d3ZxU1ZRSmh0SUhN?=
 =?utf-8?B?NXphUHBmaVZma0EwSEtHNW9FMFg3ZHkvdTNPQUIvekxCaHI5alY3dTYwd05Y?=
 =?utf-8?B?ak1kUU55QlU2RWpqMXVqQUdPYUpNOUN5Z1NnTG9VT0tFbmY0ZEVoWGpEbXZq?=
 =?utf-8?B?ZGx0ZHhwSzVpNDl6bEhWN3BBR1k2WVRzN0Q0ck1mbGJHU1dremw4NUVBY0ho?=
 =?utf-8?B?bXVucEFSVTI0dVVXUzdYc1RCMmFrVmU3aENpekpmM09vekRkN2hCWG8zZnE0?=
 =?utf-8?B?Q25TcjhQcmhOYnMySHh2UC9RTjlEMUMvcTdoV1hiL1lqUThtS0xON0xUOHJ2?=
 =?utf-8?B?T0hxNGVkTnlsV2NoQlFHcVdoeWhPdG1kR0JhRzYxUUtzWHM4TjFLUDBJclFq?=
 =?utf-8?B?Z0QrZlRyNUYxR0RDblhxWnNuMjZIUjFCZ0FQN3BDb0xpc1N1TVFMbk5lTlY3?=
 =?utf-8?B?bHVibU9JSmVQSHk2R29TbmVSRkVvSy9Ua3VsNDNRVUdiWmpWMEVYZlg3a3Zw?=
 =?utf-8?B?NHRVc3JmRTVXelFDS1RwaGVocGtXSmxUenp3QjUyQXhERFV5amgvOWVmNk5T?=
 =?utf-8?B?SlEveTk3RnM0Nm8zNWlVTFZ0NDhlamFVVnVMbzRwc2tRMDRvOEdjcnVMVDdI?=
 =?utf-8?B?bkxrTHg4OVo3Lys3N1lXeFQrcjBBeFVRVExyemtLWm82VGV2TFpVZ1VGTGpW?=
 =?utf-8?B?TmwvMVdpbnd6anZ2U21wbmxhcDlQbmZJTTlLT1ZMODlCVS9iVzRmWVF4Mjlq?=
 =?utf-8?B?RFhOdVdLN0pkYXdFeTNES2xtVzYreDdySXc4dysxQ21UbFNKNWwyN0k2U003?=
 =?utf-8?B?SVo0N28vUURXYisrdUsvTHIxV1VMVXRXelFqb1RwNU42OG96THhDeFFjZU15?=
 =?utf-8?B?TXMvUXVRdGRSVC9wekQyb0crVkk3YmkrNmMzQ1JqYUFNZHZBMVZ5RjQ2d3JN?=
 =?utf-8?B?RldPWTVIRTlsbUFOaDRsTUx2RHROYzA0cjV3b0llWnlnMC9uNzJ3MHB1OEk1?=
 =?utf-8?B?SWNTMDdmSlN4OHNYK2sxT0J4SFk0UnlmZE50enZyeDBkUWcxT1Axc1Q3dW1G?=
 =?utf-8?B?UWprWWh2T1E3akl1ZTU4bGZFb0hQZ1Z4N3dUcHpnb1F4NWNHWU5zcERSQVkz?=
 =?utf-8?B?Y3R1QnJKMzEzQjlGbUE5dW82a3FxSW16Nm9KeUNuYldoWW9Lam1zUURzaWph?=
 =?utf-8?B?cklLaGdwb20xS0lrbXJLSk0zVXJnU3NsZENETUgybzRlemZLWGUwdmt5dTRB?=
 =?utf-8?B?QVVjejF5aWdTT3J6Nlc0djh4RnBXK2ViREw0UFBjVU1RaWlUWjBDQU1zSlVa?=
 =?utf-8?B?c3dmdTVvTWhpaWp1bTBQWnFGNkt2aEJTMnFsWTlCYXEyNEhBTFA2N3VGVmk1?=
 =?utf-8?B?YnRtUDhJTDdYVldoVFV2ekhwWVQ2RFc3OG9JYjJCS2VVYk9PWWdZdytSN3lN?=
 =?utf-8?B?QWpxcEJNcmdDbXA5VmxWd2hsejBocDBYUVNLNlE4NnQzdkhlVjhyZDd6S3U4?=
 =?utf-8?B?N3R2WThMRndjck5wcjFuMzc4U1BVUEtiTzNHUVhmYmgxN3Y3SFZ2bzQ0ZjNo?=
 =?utf-8?B?WHJhUlNIbHovKzdabW1aSnUySFdjUHJzWmNWZkpCQjZhNTJrTXRZdnhTRWEz?=
 =?utf-8?B?eVpnSmYySm93M2huWDAwRVY2a2R0eUxHNGRHSndDNTVoMUc5N1d6bG12bXlw?=
 =?utf-8?B?ekdOQ1NhMGlGTHAwSWdFM0VjT3dYT041T1drN1RyalRKT0lqS1l2OG1rWnJQ?=
 =?utf-8?B?L2dXNDNmeWRDUXR4RGVmTzFoaG1pdkhyRHNjc3VjaE5LRnBVRkNaV0Y3OFhO?=
 =?utf-8?Q?xVS4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RmtuNko5YzNPd09tYytodm8xNzJTK1hFQ3ZKK2x5WWdrYmEwb1NyODE0MXNv?=
 =?utf-8?B?RjBJZU93OTVCbjYxaXFvak9lcTJoNFB2N0lQdFlIcUk2MjlSdEowckVoaHN2?=
 =?utf-8?B?eUZxc2JXczk5ZFhVSDRxcFF0dWZKWXVUYVpYcWxSVUV6OU5mNVpJQXhzcHU5?=
 =?utf-8?B?b2t1RGdaZVcwYUtYUC9BaTlQL3gwcTBmNlNjaEcyV2pzVFY1MTB6a1pjT1Fk?=
 =?utf-8?B?WUhlYzhCRlo3NkRSR1pMc1VxdFBpSFU5WXgzbFV3aWNIM0RLZDI5TGVJRlBJ?=
 =?utf-8?B?ajcwOVB6cHIwT2FDZWYxb1pJVDBSUDFOK1lrdVNWazF0N0tWSEFFMDlnSU5M?=
 =?utf-8?B?S282UEhFY0FYdmVoRWxDWkZlM3UrY3ZxbTYzL204TGc1SW5jdmRmUkdYTmV4?=
 =?utf-8?B?d0xGV1ZxQ2oxaERWcXJLcEN4YktKeithKy9aVCttdnNCMFM1YmJnRldseitN?=
 =?utf-8?B?cEFaV3AwdFRrTTBFcTBLMkFJamtRckNEY2xLUkViOVhlUEluMjQxd0hsNWhY?=
 =?utf-8?B?eVFoRlNqeGdzc3RSS0pQbTh2cVhyaytOd1pLY1FpS1pUSVVmRW1zV0poZEh1?=
 =?utf-8?B?UnFOVElCVlExcmtqQW92Y1pxZHZLRUpZdEk2SUhmYWJvcHpyaVk0ZUJ4bDJY?=
 =?utf-8?B?N055aXB4WVFydUNzMERmcHJFRVo2QVk4cFRlZCsra2pkdnlLT0VnYlo5RW14?=
 =?utf-8?B?cDJBUkpoc01FRzlpR2kwM3ZlYzBLVEF0MXFrMG5KZ1pTa2JIWlRxL3djd2Ez?=
 =?utf-8?B?Zk1wZHF3ZE44ci83T21FdzJGeHVzVU1oT0NkM3lWZFhWSVpjSzc0Z1lnZktM?=
 =?utf-8?B?NTNLNmpVVC9GOWlMY0p4SUx1cnF0cW5wa01CVWF4WFNINWtHZmE4L0FXY0Qx?=
 =?utf-8?B?d3dkbjh1NUUzcjlTdytzVGQ5VHRFZVBsQkFlNTFIMFFZVWJjOUZ3MVJIeGoz?=
 =?utf-8?B?dUhYYmx6OXhuYkJ3Tld6SDBHYUI3RHFrMjdGVzhHeXdaNklQYXJsb0hrV2lR?=
 =?utf-8?B?a3R0b1lNY0ZFOE1HNGpneG1IZHl2c09Wb0llTm1PejFNWExBYmdPTTlsQW5O?=
 =?utf-8?B?NVFXYmVEQmFkNHhVT2s3N0hrS2kzNk44UzJFdCtBbDlTZlZ1YURaaFhDYUQz?=
 =?utf-8?B?enRJYzZzeVA3NnBUS3pzb2NVL0d4dnRUNGVPZXVuUHVPaHR3Y2JqcC80enkz?=
 =?utf-8?B?NUJtMjhlaUVHMzhlNEdtdTNZOXdrMzY5dXJvMTdXL0RzcTVQV1luV253RTFr?=
 =?utf-8?B?Vyt4cUlMUHdrTUllYkxlWGdEYzlqeEZlVDB3M2p2TzRlV0xwSEJ5RVZuNGVk?=
 =?utf-8?B?bDBmSW5jOThMVG83VzFwNTBoVDFRZklFQ1BCODdBdStVZVBYaEhpS0IrNitX?=
 =?utf-8?B?Q1hlamhZazJtMUg3WXoyNGdmaEFFNlhmcGFoY0FGTStUaUo2RWxRNXFOdmtE?=
 =?utf-8?B?LytLYzF1V0ZnRjdaQVNteEJSRWphdE15bVVlQTVsQ2cvL3hscHBmOC8zbGZw?=
 =?utf-8?B?U1NlSXFEd3V4M0V3RkExUUpJMlVPSWROcjRMUWdBU2MzWHRGalpRNDREazNM?=
 =?utf-8?B?WTFFNFE0d25tNmg1SjZJa2RHaE1FeERIWE8xOFBZbUhxSklEWmx2bXpSSXNS?=
 =?utf-8?B?VUd5bHlEZkJqWjE2Tzh0WG9CTWh0azRPaWo1L2VVa1I2MlE4VEtXd3VYVUlK?=
 =?utf-8?B?bllXd1pmRmNBemZmdjA3WGdEdjgrVnAyeEZPVUtabDkwWGJKRUlKRDZhVEk5?=
 =?utf-8?B?M09xVkpSQWdUc21saVJmWTVGZVlYSnV5RGY0b254S2I0THlhV05BUGw2L29I?=
 =?utf-8?B?TklUSkpYMkpZdDdNdVEzalFoSHhxWlBrT1N6K2xGK2hqYXFuY2JZck5PY2tT?=
 =?utf-8?B?V0tMQUNLc3EvZ0IwWElmR0lWaXdYTEZUWW81aEUrRmlTWjZ2K3VOZjQrS01P?=
 =?utf-8?B?NEVQNm92cmNPNXYvbTNvTVBhU2ZGeWUwNUtkNFlsdDlxbHNtc3AvbnVRZWtz?=
 =?utf-8?B?ay9EdU1EakVvZTg5T3VGbHp6UEhkQ1J5Y09sNWFiSHJHZGVVMGJwcExKL1Vr?=
 =?utf-8?B?bktFc2Q1NzBPckN3bmRwZFFvQ0x0TXJzWGlkcXpLNkc0OVA4NjZ6ZXVGRHhZ?=
 =?utf-8?B?VEdDTEoxUGJLamRrVFFiQ0hqY3pNNmFBSmZCYzdaSDZuZEovQllkUVVoVVJH?=
 =?utf-8?B?SWE3cy84dnZZVmpYVEsrS0x3MXRwUllqMFd3a1V0TU96Z3NCcUluV3NZV3cw?=
 =?utf-8?B?bHUxd29oOFdCeVpwOFlEbFphZEZaZmhNNWJ6aUNaNHptL20xRWVKK1I3NDg4?=
 =?utf-8?B?RnEzN0lZdWhEWkVtaHFVbW5ta1RTYVo2RVBKL0FKbm9reUZNc0o4WS9UVTZI?=
 =?utf-8?Q?9zFjQ1OtjXuy+Jg8huPtIP7m99paSW5VenIm2?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4154bacf-a1f9-45b2-e05c-08de5dba5253
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 15:39:56.1070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7wtLBHpC4HPf0UCMzvCMrPCgA1VwWRFlIMssYnhJxdbo02p+8eCQslobA9gInGL8WGHtVcHXs+gCutiFTZguwjSe02n+ekR6YRKl6NLjK9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9145
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 15:40:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8742

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

