Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.72])
 by mx.groups.io with SMTP id smtpd.web12.21898.1630935094870323420
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Sep 2021 06:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=TaEsvUI9;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.72, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xlvk5pbn+S9RF7jY2F97TJISdWOk/mZi1gkG0KnfRTxZryv+AJeRyUjtuGMSOJjB/DMVai5oBf42FqkT38zDQmaal8SnbDihaiLuI+fIqcAySh1O10Fx41oll0gCojgeUIpif2PoK5NSg5DjxMqd9tw4flLbPwds2o/qqug8yo+oFUcirXIp8jhefBwXwX3zgnwPD6Df9KWql2D5M2kaaGMsUu3MSeLFY79w9hl2dB3r2hC2eT6tSB3Ob0T1g9YCJ+ZsH+YeqssAedRC4kYM2EmD1xlHH9TVcD0RTn1Wz9E/8UxJG1Dw/DsudhjHHDc91yrNzn2/S9aXqnx5dNUL6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=qkWDcJlaGAcuVi17kdUwfo3LmPW0lqbYE6jxOZKrpE8=;
 b=OisqQmUHA7ibqeI7tuTbX/FrCJioNObQKcPjNiOH1Rp2T4mizLwpzeL8koEAZSkOmE+XzykRoIB5vBBbymLFEZc1zOd+lXUby+QpT0Qb12H+XFv2RQU9ujcryUP49YHVPON0Q5MIUdvPo5izSad2KZob+HImdONYT7drZ96AJsh4RaFYcIjNycpTtGr78Vc6wSOM9eM40jNz0VVODBd34cbYqWlanOy08oduJAcmLIi41NbkD9n+vr1oGxjoPUY9fWHYc7RS9pyU0FLqozyoBNqkYuNR348x0UHLhXgDD5E0BzzbCV4JuO2m3lDG31WUWct7UCzd0VXDcme9OvG1fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkWDcJlaGAcuVi17kdUwfo3LmPW0lqbYE6jxOZKrpE8=;
 b=TaEsvUI9sjSF/SnCKZh1FtuljZguIpm+nA4ruM2NQDn/jk+szvEhocrKguvbiObXa1CnlpZAa+IiJfi1Y0p/+S9gGp3yghjsMSgLfcS7TXippb2SNVyoQh0Zf7sPbula3yPJ71rvvsYepO872ghNWheydxb1RqiOnJ5ql60YBkg=
Authentication-Results: crashcourse.ca; dkim=none (message not signed)
 header.d=none;crashcourse.ca; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB7153.eurprd04.prod.outlook.com
 (2603:10a6:208:1a0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Mon, 6 Sep
 2021 13:31:32 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00%6]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 13:31:32 +0000
Date: Mon, 6 Sep 2021 15:31:30 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: couple minor tweaks to Chapter 1
Message-ID: <20210906133130.pzsyww7fk2hrq6h5@fedora>
References: <3a8255f0-a6cb-6c59-3533-a71ddac2f355@crashcourse.ca>
In-Reply-To: <3a8255f0-a6cb-6c59-3533-a71ddac2f355@crashcourse.ca>
X-ClientProxiedBy: AM9P250CA0018.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::23) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by AM9P250CA0018.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend Transport; Mon, 6 Sep 2021 13:31:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28121df5-bb5f-4121-be80-08d9713aa40d
X-MS-TrafficTypeDiagnostic: AM0PR04MB7153:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB7153FD2E11ABF92D4E6416B7C2D29@AM0PR04MB7153.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:311;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	p3TcQQlINelzDVouTujbkOmNkR+1TtRAVRy0XjJc7Nriy1hMyZy9xDHAqaWudzPcoGDkwFuBd8dWQOp639IjALINameSDGh6yOtan7nHrcV30zfhVbD5PpqTOeT99FTfvwuJ+rcGgZexakZA65P6wV8zMUZSokXoAq4IJ+w3oTNKH27yOlh8QNMpeQHsuSo8cuR7+KYEMIS/ifw536Q+ApeRbeU0Zi0VQKDC8+1r0UA5sBcWSRchXuimOud0k/E2PtKVKglssNvPnDXsrhDPc0BEMtUNutDGW2Xu4/7rjBXcQBINb3/7ijF6ImJ9+pY7hw9Hjowc2KedtrI5/wdvnYsB3dYkyOa7VsJnDi76O3xOpPo7VdUBgkwgS/qy+60nQ3If5XQpHwp2rrlapqkHCgyVOdEJVT4tGEBIOf8bYjQnIW0wEdCRYThoDfdHZfsfUV3suYyDRaUqkZE2AIpTPB7yG+8/uURkg39ivriFIRKbqZEQZFQL8IqKFnL4IC2ZaxEi8zw02Jvj0ix7KKsTSZjW7TmTTcpoGStmlc74bVuQzYgbcfo/djwADaGxk7JfWvz5w1Vc2zYQK0uMxByvPvCRfTvl6HvBeRtQAgSqZjXOjWoRHpBMYraNvs7tqdgtQKGYPmMNyFl4Xk4zqIFgthAQqqnqSbRdcQryZ6cWUr+OqPOEWP/8GYGp4PmelOq1SPEZ5h8ADW8gxasQ3pDObw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(376002)(346002)(366004)(39850400004)(4326008)(316002)(66556008)(66946007)(478600001)(8676002)(33716001)(55016002)(5660300002)(9576002)(9686003)(44832011)(66476007)(1076003)(186003)(52116002)(86362001)(6496006)(26005)(6916009)(956004)(558084003)(38350700002)(8936002)(38100700002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?alUwwxAuzGDe7lqYh587VIBZRob0JPDeXOK1F5FuQV6oAMczLGp0MvEdmZ8f?=
 =?us-ascii?Q?KPWgdxi/NQhgBuh+9zJWYZKAnaexGSFKUHYbH2d7tuzmfd0FaFOSdyEdQWnu?=
 =?us-ascii?Q?Ti4iXItXUHHup4IXNz1lLlHX79/IuQa2ScbL5HkIh/Qtxwtaf0I7QCd3hRNw?=
 =?us-ascii?Q?2ljQNrtJ7xfBlfr34OZmfTKiBjNJKR32QO/WN8H24/yR5vkteFlQ+TadIc72?=
 =?us-ascii?Q?UDXWHzsfJlLvT0Ttk+G0AAZWRW0NzwfbsEPod74ec4bl1mGdxTmhGjpf7+mO?=
 =?us-ascii?Q?eiU9twnDHZJ2czKwUrN240fcOabFJb03zaO8F3S2k93+iAwH6UVzghyCnkmx?=
 =?us-ascii?Q?GjmzvVJatflXmO/tQEYRJJUdy9kNatjbLLWSuKNnC6w9paILPYHzpkZfFc/D?=
 =?us-ascii?Q?OPTq35dQJZdu+GBWe640ZLO2+uezd13GoiHhpuA+7f5I3HqdwT0LHMLDcUdy?=
 =?us-ascii?Q?O4CYkSX4lqBCS0dcF+8PLeppwcyJOhARMdWJgLQpafQdVO0K3PMPuY+1NOD2?=
 =?us-ascii?Q?pW6jnmUwjf824TCQa5gTjWn5Sf49otNEJkdQBu5RFythTaHrWC5STUqS/Fu7?=
 =?us-ascii?Q?xz49+bCQDWkAqMUz++FFOUm6PHU4SwXh+yEuSMvA5oJH2aE75dRYnnxN0p9a?=
 =?us-ascii?Q?ozmM/PvWqn8gR3fcrfkIKYIyhHjF5v66b0ZrZ5yzyLMzZ6G5mgpEdGvA7Lq2?=
 =?us-ascii?Q?izO08Ubl6z3CuQzffNPCvmpA5R13ctnf4e/GDl37JLW7hYwZET5qL5ljV/PB?=
 =?us-ascii?Q?nwlaDyfr3nlBdtGvcBoJT7yd4zM1pkWPJV7LglBz/BcTKog8HZTm4NhZ922C?=
 =?us-ascii?Q?Vke7HqQBuXD/uHuARpY6j3IdQb8iOGxZ0qEKUHt8cyGYlj5wT+EhYDC0pN9I?=
 =?us-ascii?Q?uOOrYYC6r27vq9pHNnFnyVLc8IGD+I7TnqlazZItuOUs+qiYMk/OAhPX/V8c?=
 =?us-ascii?Q?gMQMAVzhIJ52VoiXTdyDDN75DEvFLQbyv1B7l9eUe1HUNwu0r/0rIapoOj76?=
 =?us-ascii?Q?ziBZ/DPpEQVlbGFjYVNhZPrLjfLzUUnbRwmDLpa2h569IcpSXH8wHB7/+X8L?=
 =?us-ascii?Q?+xANqi3VgH4lJ878tor87A3+w2TQOyXC3eK3om2wMPK5abZ4V0LgBD1Tx7Db?=
 =?us-ascii?Q?XeSfoiCrVWMpZ1oGKnp7JRHwdlEmLv78HDPs2NyQVQxIVYpfK8IORNVvUBu5?=
 =?us-ascii?Q?iKBa87scn19X9zUcFqKd5cck9SMlZEZZP1Xup8JfPFkMVmebULmRYapT2Ag1?=
 =?us-ascii?Q?GCLY6XOWGfJDQJsqwYRXHwjI5B6NPdCgX05gF/ssiloxw6I/7W504RAWBgfB?=
 =?us-ascii?Q?F0jWytu5+o97Sh9qfbpPfa3c?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28121df5-bb5f-4121-be80-08d9713aa40d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 13:31:32.5171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V65fHXDCRxMxjEkqFUIU6pYlwKUh4pXMz7h0LUikeZLUFkzy1/UuuPbR7EvMsvq2jWgP7mC5ch73i52pBFOKwXoDSb1G2gFuNKt9wo4NItIpSB0ME2lbkl4womOP867k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7153
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

On Mon, Sep 06, 2021 at 07:59:07AM -0400, Robert P. J. Day wrote:
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 

Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks,
Quentin
