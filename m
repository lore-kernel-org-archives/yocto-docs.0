Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.68])
 by mx.groups.io with SMTP id smtpd.web10.14294.1630310706881564827
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Aug 2021 01:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=elL3sPyL;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.5.68, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LST5pZqocGDV7TJIIQz7DI/ShXwe7VmY6GifGQnPIWvQk+UIcDI+WOM7qEo7TfxEo5OVZPlwdV/vzXepbP74pj/u5V7Nn+ODInsJTbt+Le3AmNZybPK71gyTJidPela/0WXTQXUPL8oE7XMhghWLRnuS9jeDaIRXMhL0AY84SNizm6i/an9Qb3zVUdMsUbVHxu502KjnvZEHBOnMhdOZQ5hsGK4FHn+XnW2YYdf6yW7uCJxm9RN28cmLYMMpCx6/D0awczckaR140TKLatVwDJQ6IqWvTz/5Aa7moM+d/1SHXiTs5D+g2Urs3gvPRFzZ+0lz+d+kp5uyw6yhQ1ywfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QxpBOfpFXTy3Ct3h479uuZoQBTvIQJSyLuqtUEAHFg=;
 b=TLHbwLfGEvZPYRUMdZo6UavBWoxPvcIbB3oEbpqvaMOLXfoduk2rcZ1p5+LnVqBUV2xhFAdW1ti3LdLWukx/4yQURvOBXYbJv3m7bKP4lTWxPdyf8VC57iV5F88iLdZl8ptUCkBi1SS0QHkeqG3zdML/+7gaQihxN1aeqz9ZPJaBnMZKA5HJOg0HPX0mqd4qfVcfEkuL6gNNj5Rma4tzfodQYzJbLth4slqtQL3EItlXZ8XILAuNN8UR6CGg8vPhXWnUYi+IiOInFCPBBz/ZaBcxqJdrheXl1O/+9EIR1VRF0OD9gsYeKhMeNm4jr5Tpeu4piNtPzGul5eK/l2+gtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QxpBOfpFXTy3Ct3h479uuZoQBTvIQJSyLuqtUEAHFg=;
 b=elL3sPyL5VMaYbXq52b9flca6427w+XdQrk1LMPJ/d1FSyfTxFcsXPc5wB/sDL70V/yruTw0IPGNsnXsOn5n1hFX5gzuncJz5YMySXf9B3w3FVRrX/8OxuXW3IxpJIXE1BkyPnfaXfI8ifVURIWX6N8mUYmGa3sr6mSFOzatPOM=
Authentication-Results: crashcourse.ca; dkim=none (message not signed)
 header.d=none;crashcourse.ca; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB5460.eurprd04.prod.outlook.com
 (2603:10a6:208:11c::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Mon, 30 Aug
 2021 08:05:04 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00%6]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 08:05:04 +0000
Date: Mon, 30 Aug 2021 10:05:02 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev manual, ch 1: various pedantic nitpickery
Message-ID: <20210830080502.xbsssnnrpucrzivn@fedora>
References: <f110ee5f-4b96-2310-d02e-9f943d6f5b4b@crashcourse.ca>
In-Reply-To: <f110ee5f-4b96-2310-d02e-9f943d6f5b4b@crashcourse.ca>
X-ClientProxiedBy: AM3PR05CA0098.eurprd05.prod.outlook.com
 (2603:10a6:207:1::24) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by AM3PR05CA0098.eurprd05.prod.outlook.com (2603:10a6:207:1::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend Transport; Mon, 30 Aug 2021 08:05:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86ee4853-0122-486e-1d9b-08d96b8cdfa5
X-MS-TrafficTypeDiagnostic: AM0PR04MB5460:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB54601F8E3BA1A8F5532656D0C2CB9@AM0PR04MB5460.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WeEkh4492fSn/NTUnv+BAmtvSCAuFTuWVsUwpntZ1Vo9azjpdzYZGXB94hd6pMw1Jd6W4HrEbOJRv48Ys50J0m/8pcI8bbD+ZhROHi/o5aIag7ThYaYgILwZnbkEOsEwVugyZHclR3jYd+mI7mDtgSPSCHJ/qRUrQoB/C3es/nxDzta6MUNJHO0zupJQCHZ1rVpaD5uHsX8zXxbCDkfyXbNU+WS3IZ6m0tdpNWS4R5fg0NaBLDlDC5X8C0pFgU3P4bfrR2whevqU3SQB3hmScXsxOT7tMb9Q+Mg/96dzT1XR8y+2F64+RbMjAI3QyWY6jF7mcbH1LYnoxS6xujV/5gLhxnHOnGurPWHd6SWW7pCWPxCjIXudPTRE5l8n6UlTzCWx6Zvv1Xgu7dMdFWZiSYNqbiVRUsO/weY/WYzw94k9Ur5SjYldlEdBNO1HyEpeYPR+AQbskhHPwRhjXWBs+ebqWkyb5Ejr6MHmeMAFfUc0sTk5+VK6il8r8wmeiAeupAVcqUC0ck+FpruBfHG7tzj7EBm3gdMJUNWU8ww6C4haCQ9sRpuqW8wn7f0lSRNpxuyS5M8NQGiqWA6v4x6njxRuyp2a+pgPuszvAn2YOK8XVv0xxaL7BUD3qbmSrXOZiQUe/xp6k23HXwzk6JzIpuKv23v1iSwDLEs+79/sZ+gGmAUF9YeR7RTFMzqPENi8RbfE5ttQrLXO/iUgcg/m4A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(376002)(396003)(39840400004)(366004)(33716001)(8936002)(44832011)(3716004)(9576002)(6916009)(4326008)(66476007)(1076003)(186003)(956004)(2906002)(6496006)(9686003)(26005)(86362001)(478600001)(5660300002)(8676002)(38350700002)(38100700002)(52116002)(66946007)(316002)(55016002)(66556008)(558084003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TmeoQWohItFjzqjuE7W8UgZB5hBiyIpsufuRDpQTRcCGfqirq5Rgxnri7vsO?=
 =?us-ascii?Q?lJch9iUFeUgKJey5Ror02vIYki0kUq+baJqOpwfOBNvXnsTmzALo1FuaiQ39?=
 =?us-ascii?Q?s+/ublpJt71iu7bZZFaIs1QpBFYXgI1xs5/svAMstZRzj1nLeVK15MROplQ8?=
 =?us-ascii?Q?wKZSCLjcqORTFjJW7PWn8owIamEX3KOjf4HvA3VSsOsgeslPXjHfmuYVXh2b?=
 =?us-ascii?Q?b4B4dBOhA+OtzHmMDouRbbeslurpoxkfVzXBrRbiHCQ1jw0Cbog1c6Uje8Os?=
 =?us-ascii?Q?ybA2liByUwbj1qi296e6MkjBCWCjCzEYDhdfhOvZvMTABiat/m3LSOfPE0SR?=
 =?us-ascii?Q?9S1GcChjo9yKtuoK4A+mUI6OtXlGcUvSMOUZcPN6kp+p2QZ51jV0zzXWh5Iy?=
 =?us-ascii?Q?okCo1QYSLhbnRAK1tKFoLsi+qgnGYhyF4CqrXfDDqEq1qXlHDzntGLSfAxoP?=
 =?us-ascii?Q?7/oc/X9qBoiKjWmjzab9GW51uLncu/HxvQnDsaz0rhMIGkBCm/j24T+t6Hx5?=
 =?us-ascii?Q?yisPZSX4mErwiKCYAUoFKeLtvkUWisl0/roHEojyE6zQSS4H52ktzqUt1aLG?=
 =?us-ascii?Q?RqhWsO4OR8mSQbf8VkyREbispHyi9eNF7+nACFOjCmZT4U5KFaZmMpQtkSO2?=
 =?us-ascii?Q?NzdZPaXsEi8RFd7/ijmKHIxnSs/CfNnTkihSZRwCgZzJHZXRA4lzwlRJYkGG?=
 =?us-ascii?Q?Ek6q/pSd74wozojf3SWeBzVtws+oIuyvfc13S14SZCjapiUziIW/a2qTo2U3?=
 =?us-ascii?Q?5+0PguTBfWC/ib3XVfHRYN3TVrfoyjTnEohpwOe5ovZlxLgBpWnjzUCdlS0U?=
 =?us-ascii?Q?LbHQp68ZQpFAhJ9iDzD7wOAGfcY+iQvBQm6it3jwMmGdF0Ptzf1R/PgFO75q?=
 =?us-ascii?Q?9E8CmhSEARq5k5W5DlLuR7rvCNRB4QELtxhyqVvDOlblWOVrvRk6PaJrvLYO?=
 =?us-ascii?Q?Pr1XU2NVDz2YD2pIJP+KKp8Qi+QfGdlxlfcQOFDH2ILwJsrFlY3VbhucheFm?=
 =?us-ascii?Q?RFeSxmwYIDj7BbMj/v/HF85vOOElm7tOcsT8QLDJURlAY/lMWb9/wdrQ/Us+?=
 =?us-ascii?Q?A5koE99pjdhZvhD0REdynG5ocrvsY3N9CLQ7cC/dKjMhkqtAGJnihOch856x?=
 =?us-ascii?Q?JEe4wu5BLPDCjJEnvgjg5NAoFraWAQVT4pVLR0oacUHdKA1guywID+2yY8t6?=
 =?us-ascii?Q?FONQDgG62K6aEYaqenVlF7ZR0XAsRnP7mjiNO5mLbf8z/qcf5sF77wVRol01?=
 =?us-ascii?Q?a5ivRUU0R7Ta524GeenDkrIx5whsnaqiQ0C4dW1Htsl/QJCMw5LatKbwx5wT?=
 =?us-ascii?Q?j+YPRxOJHFnIY5lK4uD/NjeJ?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ee4853-0122-486e-1d9b-08d96b8cdfa5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 08:05:04.2538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0SZTb4ixhZjOX5sOaxdue9hELKl1ttojkcuyr6A3JNq0d838/65iqh8IIUrDZOWezBfj4W2xUvEDEqgEUFCOK7OELygp0g9eG3ydEUT37DHdF3jap6ciYrL92mXMmZt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5460
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

On Fri, Aug 27, 2021 at 03:57:43PM -0400, Robert P. J. Day wrote:
> 
> Some minor grammatical and structure tweaks.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 

Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks!
Quentin
